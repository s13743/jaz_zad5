package rest.services;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path("/service/test")
public class TestRest {

	@POST
	@Produces(MediaType.TEXT_PLAIN)
	public Response test(){
		return Response.ok("working").build();
	}
}
