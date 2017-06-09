package rest.services;

import java.util.List;
import static java.lang.Character.isUpperCase;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.Produces;

import org.apache.commons.validator.routines.EmailValidator;
import static com.google.common.base.Strings.isNullOrEmpty;

import domain.Person;

@Path("/people")
@Stateless
public class PersonResource {
	@PersistenceContext
	EntityManager em;
	
	@Context
	private HttpServletRequest httpRequest;
	
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public List<Person> get() {
		
		TypedQuery<Person> query = em.createNamedQuery("person.all", Person.class);
		
		String page = httpRequest.getParameter("page");
		
		if (isNullOrEmpty(page))  {
			return query.getResultList();
		}

		int p = Integer.valueOf(page)-1;
		
		query.setMaxResults(3);
		query.setFirstResult(p * 3);
		
		return query.getResultList();
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	public Response add(Person person) {
		
		if (!personValidator(person)) {
			return Response.status(404).build();
		}
		
		em.persist(person);
		
		return Response.ok(person.getId()).build();
	}
	
	@PUT
	@Path("/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response update(@PathParam("id") int id, Person p) {
		
		Person result = getPersonById(id);
		
		if (result == null || !personValidator(p)) {
			return Response.status(404).build();
		}
		
		result.setAge(p.getAge());
		result.setBirthday(p.getBirthday());
		result.setEmail(p.getEmail());
		result.setFirstName(p.getFirstName());
		result.setGender(p.getGender());
		result.setLastName(p.getLastName());
		
		return Response.ok().build();
	}
	
	@DELETE
	@Path("/{id}")
	public Response delete(@PathParam("id") int id) {
		
		Person result = getPersonById(id);
		
		if (result == null) {
			return Response.status(404).build();
		}
		
		em.remove(result);
		
		return Response.ok().build();
	}
	
	private Person getPersonById(int id) {
		return em.createNamedQuery("person.id", Person.class).setParameter("personId", id).getSingleResult();
	}
	
	private boolean personValidator(Person p) {
		
		String firstName = p.getFirstName();
		String lastName = p.getLastName();
		
		char firstLetterOffirstName = firstName.charAt(0);
		char firstLetterOflastName = lastName.charAt(0);
		
		String firstandLastNameWithoutFirstLetter = firstName.substring(1) + lastName.substring(1);
		
		int age = p.getAge();
		String email = p.getEmail();
		
		if (isNullOrEmpty(firstName) || isNullOrEmpty(lastName) || isNullOrEmpty(email) || firstName.length() < 2 || lastName.length() < 2 ||
				firstName.length() > 20 || lastName.length() > 20 || !firstandLastNameWithoutFirstLetter.chars().allMatch(Character::isLowerCase) ||
				!isUpperCase(firstLetterOffirstName) || !isUpperCase(firstLetterOflastName) || age < 18 || age > 110 || !EmailValidator.getInstance().isValid(email)) {
			return false;
		}

		return true;
	}
}