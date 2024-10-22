package loja_virtual.mentoria.model;

import jakarta.persistence.*;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.Objects;

@Entity
@Table(name = "tb_cupom_desconto")
@SequenceGenerator(name = "seq_tb_cupom_desconto", sequenceName = "seq_tb_cupom_desconto", allocationSize = 1, initialValue = 1)
public class CupomDesconto implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_tb_cupom_desconto")
    private Long id;

    @Column(nullable = false)
    private String codDescricao;

    private BigDecimal valorRealDesconto;

    private BigDecimal valorPercDesconto;

    @Column(nullable = false)
    @Temporal(TemporalType.DATE)
    private Date validadeCupom;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCodDescricao() {
        return codDescricao;
    }

    public void setCodDescricao(String codDescricao) {
        this.codDescricao = codDescricao;
    }

    public BigDecimal getValorRealDesconto() {
        return valorRealDesconto;
    }

    public void setValorRealDesconto(BigDecimal valorRealDesconto) {
        this.valorRealDesconto = valorRealDesconto;
    }

    public BigDecimal getValorPercDesconto() {
        return valorPercDesconto;
    }

    public void setValorPercDesconto(BigDecimal valorPercDesconto) {
        this.valorPercDesconto = valorPercDesconto;
    }

    public Date getValidadeCupom() {
        return validadeCupom;
    }

    public void setValidadeCupom(Date validadeCupom) {
        this.validadeCupom = validadeCupom;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CupomDesconto that = (CupomDesconto) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }


}