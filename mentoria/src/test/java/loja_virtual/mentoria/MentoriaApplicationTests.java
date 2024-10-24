package loja_virtual.mentoria;

import loja_virtual.mentoria.model.Acesso;
import loja_virtual.mentoria.repository.AcessoRepository;
import loja_virtual.mentoria.service.AcessoService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(classes = MentoriaApplication.class)
class MentoriaApplicationTests {

	@Autowired
	private AcessoRepository repository;

	@Autowired
	private AcessoService service;

	@Test
	public void testCadastraAcesso() {
		Acesso acesso = new Acesso();
		acesso.setDescricao("ROLE_ADMIN");
		repository.save(acesso);



	}

}