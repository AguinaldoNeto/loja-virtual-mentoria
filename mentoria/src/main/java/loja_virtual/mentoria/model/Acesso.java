package loja_virtual.mentoria.model;

import jakarta.persistence.*;
import org.springframework.security.core.GrantedAuthority;

import java.io.Serial;
import java.util.Objects;

@Entity
@Table(name = "tb_acesso")
@SequenceGenerator(name = "seq_tb_acesso", sequenceName = "seq_tb_acesso", allocationSize = 1, initialValue = 1)
public class Acesso implements GrantedAuthority {

    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_tb_acesso")
    private Long id;

    /*Acesso: ROLE_ADMIN OU ROLE_SECRETARIO*/
    @Column(nullable = false)
    private String descricao;


    @Override
    public String getAuthority() {
        return this.descricao;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Acesso acesso = (Acesso) o;
        return Objects.equals(id, acesso.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }
}