package pkiapp;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;

public class IdTokenVerifierAndParser {
    private static final String GOOGLE_CLIENT_ID = "862838389425-l3n518fj9ge39nqnipqcu35qsucjhqtv.apps.googleusercontent.com";

    public static GoogleIdToken.Payload getPayload (String tokenString) throws Exception {

        com.google.api.client.json.jackson2.JacksonFactory jacksonFactory = new com.google.api.client.json.jackson2.JacksonFactory();
        GoogleIdTokenVerifier googleIdTokenVerifier =
                            new GoogleIdTokenVerifier(new NetHttpTransport(), jacksonFactory);

        GoogleIdToken token = GoogleIdToken.parse(jacksonFactory, tokenString);

        if (googleIdTokenVerifier.verify(token)) {
            GoogleIdToken.Payload payload = token.getPayload();
            if (!GOOGLE_CLIENT_ID.equals(payload.getAudience())) {
                throw new IllegalArgumentException("Audience mismatch");
            } else if (!GOOGLE_CLIENT_ID.equals(payload.getAuthorizedParty())) {
                throw new IllegalArgumentException("Client ID mismatch");
            }
            return payload;
        } else {
            throw new IllegalArgumentException("id token cannot be verified");
        }
    }
}