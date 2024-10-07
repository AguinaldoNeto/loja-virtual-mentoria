package loja_virtual.mentoria.model;

import jakarta.persistence.*;

import java.io.Serial;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "tb_status_rastreio")
@SequenceGenerator(name = "seq_tb_status_rastreio", sequenceName = "seq_tb_status_rastreio", allocationSize = 1, initialValue = 1)
public class StatusRastreio implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_tb_status_rastreio")
    private Long id;

    private String centroDistribuicao;

    private String cidade;

    private String estado;

    private String status;

    @ManyToOne
    @JoinColumn(
            name = "venda_compra_loja_virtual_id",
            nullable = false,
            foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT, name = "venda_compra_loja_virtual_fk")
    )
    private VendaCompraLojaVirtual vendaCompraLojaVirtual;


    public void setId(Long id) {
        this.id = id;
    }

    public void setCentroDistribuicao(String centroDistribuicao) {
        this.centroDistribuicao = centroDistribuicao;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public VendaCompraLojaVirtual getVendaCompraLojaVirtual() {
        return vendaCompraLojaVirtual;
    }

    public void setVendaCompraLojaVirtual(VendaCompraLojaVirtual vendaCompraLojaVirtual) {
        this.vendaCompraLojaVirtual = vendaCompraLojaVirtual;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        StatusRastreio that = (StatusRastreio) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }
}