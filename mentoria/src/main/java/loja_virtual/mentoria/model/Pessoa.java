package loja_virtual.mentoria.model;

import jakarta.persistence.*;

import java.io.Serial;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS) /*UTILIZADO COM ABSTRAÇÃO - não vai criar a tabela pessoa, somente a FISICA e JURIDICA que são classes concretas*/
@SequenceGenerator(name = "seq_tb_pessoa", sequenceName = "seq_tb_pessoa", allocationSize = 1, initialValue = 1)
public abstract class Pessoa implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_tb_pessoa")
    private Long id;

    private String nome;

    private String email;

    private String telefone;

    //SE APAGAR UMA PESSOA, APAGA TODOS OS ENDEREÇOS, ISSO EM CASCATA E SÓ CARREGA OS ENDEREÇOS SE A GENTE FIZER A CHAMADA GET
    @OneToMany(
            mappedBy = "pessoa",
            orphanRemoval = true,
            cascade = CascadeType.ALL,
            fetch = FetchType.LAZY)
    private List<Endereco> enderecos = new ArrayList<Endereco>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public List<Endereco> getEnderecos() {
        return enderecos;
    }

    public void setEnderecos(List<Endereco> enderecos) {
        this.enderecos = enderecos;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Pessoa pessoa = (Pessoa) o;
        return Objects.equals(id, pessoa.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }
}
