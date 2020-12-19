package definition;

import groovy.json.internal.LazyMap;

import org.apache.commons.collections.map.LazySortedMap;
import support.RESTSupport;

public class Processo {

    private static LazyMap camposJson = new LazyMap();
    private static final String URL = "http://agapito-server.herokuapp.com/processos/";
    private static String id = "";

    public static void limparCampos() {
        camposJson.clear();
    }

    public static void preencherCampo(String campo, String valor) {
        camposJson.put(campo, valor);
    }

    public static String getEndPoint() {
        return URL;
    }

    public static LazyMap getCampos() {
        return camposJson;
    }

    public static void setId(String _id) {
        id = _id;
    }

    public static String getId() {
        return id;
    }

    public static String recuperarCampo(String campo) {
        Object valor = RESTSupport.key(campo);
        /*Verificação necessária pois quando o objeto é nulo e ocorre a tentativa de convertê-lo
        para string, gera um erro de nullPointerException.
        Poderia ser resolvido com: return String.valueOf(RESTSupport.key(campo));
        Porém, acerretaria a necessidade de escrever: 'com valor igual a "null"'
        */
        return (valor == null) ? "" : valor.toString();
    }
}
