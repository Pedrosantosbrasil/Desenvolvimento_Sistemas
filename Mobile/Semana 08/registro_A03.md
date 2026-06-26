import android.content.Context
import androidx.room.Room
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class TarefaRepository(context: Context) {

    // 1. Inicializa o Banco de Dados
    private val db = Room.databaseBuilder(
        context.applicationContext,
        AppDatabase::class.java, "viva-tarefas-db"
    ).build()

    private val tarefaDao = db.tarefaDao()
    private val repositoryScope = CoroutineScope(Dispatchers.IO)

    // C - Create (Inserir)
    fun adicionar(titulo: String, status: String = "pendente") {
        repositoryScope.launch {
            val novaTarefa = Tarefa(titulo = titulo, status = status)
            tarefaDao.inserirTarefa(novaTarefa)
            println("Tarefa inserida com sucesso: $titulo")
        }
    }

    // R - Read (Listar)
    fun listarTodas(callback: (List<Tarefa>) -> Unit) {
        repositoryScope.launch {
            val lista = tarefaDao.obterTodasTarefas()
            callback(lista)
        }
    }

    // U - Update (Atualizar)
    fun atualizarStatus(tarefa: Tarefa, novoStatus: String) {
        repositoryScope.launch {
            val tarefaAtualizada = tarefa.copy(status = novoStatus)
            tarefaDao.atualizarTarefa(tarefaAtualizada)
            println("Tarefa ${tarefa.id} atualizada para: $novoStatus")
        }
    }

    // D - Delete (Remover)
    fun deletar(tarefa: Tarefa) {
        repositoryScope.launch {
            tarefaDao.removerTarefa(tarefa)
            println("Tarefa ${tarefa.id} removida.")
        }
    }
}