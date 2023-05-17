package Features.PetStore;

import com.intuit.karate.junit5.Karate;

public class PetStoreRunner {
    @Karate.Test
    Karate testPet() {return Karate.run("petStore/Pet").relativeTo(getClass());}
}
