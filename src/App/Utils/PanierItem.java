package App.Utils;

import java.util.Objects;

public class PanierItem {
    private Long idProduct;
    private String label;
    private double price;
    private int qte;

    public PanierItem(){}

    public PanierItem(Long idProduct, String label, double price, int qte) {
        this.idProduct = idProduct;
        this.label = label;
        this.price = price;
        this.qte = qte;
    }

    public Long getIdProduct() {
        return idProduct;
    }

    public void setIdProduct(Long idProduct) {
        this.idProduct = idProduct;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQte() {
        return qte;
    }

    public void setQte(int qte) {
        this.qte = qte;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof PanierItem) {
            PanierItem o = (PanierItem) obj;
            return o.getIdProduct().equals(this.getIdProduct());
        }
        return false;
    }

    @Override
    public int hashCode() {
        return Objects.hash(idProduct, label, price, qte);
    }
}
