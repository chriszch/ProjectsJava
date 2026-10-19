import java.util.*;
import javax.swing.*;

public class Produto {
    protected int codigo;
    protected String descricao;
    private double precoCusto;
    private int quantidadeEstoque;
    
    public Produto(int codigo, String descricao, double precoCusto) {
        this.codigo = codigo;
        this.descricao = descricao;
        this.precoCusto = precoCusto;
        this.quantidadeEstoque = 0;
    }
    
    public double getprecoCusto() {
        return precoCusto;
    }
    
    public void vender(int qtd) {
        if(qtd > 0){
            quantidadeEstoque -= qtd;
        }
    }
    
    public void comprar(int qtd) {
        if(qtd > 0){
            quantidadeEstoque += qtd;
        }
    }
}

class ProdutoPerecivel extends Produto {
    private String dataValidade;
    
    public ProdutoPerecivel(int codigo, String descricao, double precoCusto, String dataValidade) {
        super(codigo, descricao, precoCusto);
        this.dataValidade = dataValidade;
    }
    
    public void exibirDetalhes() {
        String detalhe = "==== produto perecivel ====\n"+
        "codigo: "+ codigo + "\n" + 
        "descricao: "+ descricao + "\n" + 
        "precoCusto: "+ getprecoCusto() + "\n" + 
        "dataValidade: "+ dataValidade;

        JOptionPane.showMessageDialog(null, detalhe);
    }
}

class Principal {
    public static void main(String[] args) {
        int codigo = Integer.parseInt(JOptionPane.showInputDialog("codigo do produto"));
        String descricao = JOptionPane.showInputDialog("descricao do produto");
        double preco = Double.parseDouble(JOptionPane.showInputDialog("preco do produto"));
        String validade = JOptionPane.showInputDialog("validade do produto");
        int qtdCompra = Integer.parseInt(JOptionPane.showInputDialog("qtd de compra"));

        ProdutoPerecivel p = new ProdutoPerecivel(codigo, descricao, preco, validade);

        p.exibirDetalhes();
        p.comprar(qtdCompra);
    }
}
