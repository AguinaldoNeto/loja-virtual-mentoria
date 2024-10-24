package loja_virtual.mentoria;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EntityScan(basePackages = "loja_virtual.mentoria.model")
@ComponentScan(basePackages = {"loja_virtual.mentoria.*"})
@EnableJpaRepositories(basePackages = {"loja_virtual.mentoria.repository"})
@EnableTransactionManagement
public class MentoriaApplication {

	public static void main(String[] args) {
		SpringApplication.run(MentoriaApplication.class, args);
	}

}