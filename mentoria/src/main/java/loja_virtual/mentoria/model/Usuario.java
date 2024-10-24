package loja_virtual.mentoria.model;

import jakarta.persistence.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.Serial;
import java.util.Collection;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "tb_usuario")
@SequenceGenerator(name = "seq_tb_usuario", sequenceName = "seq_tb_usuario", allocationSize = 1, initialValue = 1)
public class Usuario implements UserDetails {

    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_tb_usuario")
    private Long id;

    @Column(nullable = false)
    private String login;

    @Column(nullable = false)
    private String senha;

    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    private Date dataAtualSenha;

    /*CARREGA OS ACESSOS SÓ QUANDO PRECISAR*/
    @OneToMany(fetch = FetchType.LAZY)
    /*UNINDO AS TABELAS DE USUÁRIO E ACESSO, CRIANDO A TABELA USUÁRIO_ACESSO*/
    /*CRIA NOME DA TABELA*/
    /*DEFINE OS CAMPOS E DA UM NOME PARA O CONJUNTO DE ATRIBUTOS CRIADOS (É UMA ESPÉCIE DE RESTRIÇÃO P/ NÃO DUPLICAR)*/
    /*JOIN COLUMNS VAI ASSOCIAR O NOME DO ATRIBUTO A TABELA DEVIDA E O USUÁRIO PODE TER VÁRIOS TIPOS DE ACESSO, PORTANTO DEVE SER FALSE*/
    @JoinTable(
            name = "tb_usuarios_acesso",
            uniqueConstraints = @UniqueConstraint(columnNames = {"usuario_id", "acesso_id"}, name = "unique_access_user"),
    joinColumns =
    @JoinColumn(name = "usuario_id", referencedColumnName = "id", table = "tb_usuario", unique = false, foreignKey = @ForeignKey(name = "usuario_fk", value = ConstraintMode.CONSTRAINT)),
    inverseJoinColumns =
    @JoinColumn(name = "acesso_id", referencedColumnName = "id", table = "tb_acesso", unique = false, foreignKey = @ForeignKey(name = "acesso_fk", value = ConstraintMode.CONSTRAINT)))
    private List<Acesso> acessos;

    @ManyToOne(targetEntity = Pessoa.class)
    @JoinColumn(
            name = "pessoa_id",
            nullable = false,
            foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "pessoa_fk")
    )
    private Pessoa pessoa;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public Date getDataAtualSenha() {
        return dataAtualSenha;
    }

    public void setDataAtualSenha(Date dataAtualSenha) {
        this.dataAtualSenha = dataAtualSenha;
    }

    public Pessoa getPessoa() {
        return pessoa;
    }

    public void setPessoa(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    /*Autoridades = são os acessos, ou seja, ROLE_ADMIN, ROLE_SECRETARIO, ROLE_ADMIN*/
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return this.acessos;
    }

    @Override
    public String getPassword() {
        return this.senha;
    }

    @Override
    public String getUsername() {
        return this.login;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}