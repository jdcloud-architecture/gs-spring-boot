package hello;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.net.InetAddress;
import java.net.UnknownHostException;

@SpringBootApplication
@RestController
public class Application {

    @RequestMapping("/")
    public String home() {

        InetAddress ip;
        try {
            ip = InetAddress.getLocalHost();
            return "V1.0-003: Hello Docker World from "  + ip.toString() + "\n";
        } catch (UnknownHostException e) {

            return(e.toString());
        }
    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}
