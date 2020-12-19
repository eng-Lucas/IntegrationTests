package steps;

import cucumber.api.PendingException;
import cucumber.api.java.pt.Dado;
import cucumber.api.java.pt.E;
import cucumber.api.java.pt.Então;
import cucumber.api.java.pt.Quando;
import definition.Processo;
import groovy.json.internal.LazyMap;
import org.junit.Assert;
import support.RESTSupport;

public class ProcessoSteps {

    @Dado("^que o usuário gostaria de salvar seu registro$")
    public void queOUsuarioGostariaDeSalvarSeuRegistro() {
        Processo.limparCampos();
    }

    @E("^o usuário informar \"([^\"]*)\" com valor igual a \"([^\"]*)\"$")
    public void oUsuarioInformarComValorIgualA(String campo, String valor) throws Throwable {
        Processo.preencherCampo(campo, valor);
    }

    @Quando("^o usuário clicar no botão salvar$")
    public void oUsuarioClicarNoBotaoSalvar() {
        RESTSupport.executePost(Processo.getEndPoint(), Processo.getCampos());
        Object id = RESTSupport.key("id");
        if (id != null)
            Processo.setId(id.toString());
    }

    @Então("^o usuário deveria ver a mensagem \"([^\"]*)\"$")
    public void oUsuarioDeveriaVerAMensagem(String tipo) throws Throwable {
        LazyMap messageJson = new LazyMap();
        messageJson.put("salvo com sucesso", 201);
        messageJson.put("sucesso", 200);
        messageJson.put("sem conteúdo", 204);
        messageJson.put("não encontrado", 404);
        messageJson.put("não autorizado", 401);
        messageJson.put("entidade não processada", 422);

        Assert.assertEquals(messageJson.get(tipo),RESTSupport.getResponseCode());
    }

    @Quando("^o usuário clicar em mostrar$")
    public void oUsuarioClicarEmMostrar() {
        RESTSupport.executeGet(Processo.getEndPoint() + Processo.getId());
    }

    @Dado("^que o usuário queira ver o último processo criado$")
    public void queOUsuarioQueiraVerOUltimoProcessoCriado() {
        RESTSupport.executeGet(Processo.getEndPoint() + Processo.getId());
    }

    @Quando("^alterar o campo \"([^\"]*)\" para o valor \"([^\"]*)\"$")
    public void alterarOCampoParaOValor(String campo, String valor) throws Throwable {
        Processo.preencherCampo(campo, valor);
    }

    @E("^o usuário clicar em editar$")
    public void oUsuarioClicarEmEditar() {
        RESTSupport.executePut(Processo.getEndPoint() + Processo.getId(), Processo.getCampos());
    }

    @Então("^o usuário visualiza o campo \"([^\"]*)\" com valor igual a \"([^\"]*)\"$")
    public void oUsuarioVisualizaOCampoComValorIgualA(String campo, String valor) throws Throwable {
        String atual = Processo.recuperarCampo(campo);
        Assert.assertEquals(valor, atual);
    }

    @Quando("^o usuário clicar em deletar$")
    public void oUsuarioClicarEmDeletar() {
        RESTSupport.executeDelete(Processo.getEndPoint() + Processo.getId());
    }
}
