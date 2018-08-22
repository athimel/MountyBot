package org.zoumbox.mountyBot.rest.v1;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

@Path("/v1/bot")
@Produces(MediaType.APPLICATION_JSON + ";charset=utf-8")
public class BotService {

    @GET
    public String talk(@QueryParam("raw") String message) {
        if (message.contains("bot")) {
            return "Talking to me?";
        }
        return "non non";
    }

}
