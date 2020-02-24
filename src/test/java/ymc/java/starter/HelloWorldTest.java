
// my package name
package ymc.java.starter;

// include some package
//import org.apache.log4j.Logger;
import org.junit.Test;
import static org.hamcrest.core.Is.is;
import static org.junit.Assert.assertThat;

// create my class
public class HelloWorldTest {
  @Test
  public void testHelloWorld() {
    HelloWorld helloWorld = new HelloWorld();
    assertThat(helloWorld.sayHello(), is("Hello World."));
  }
}
