# NÃO SE ESQUEÇA DE BAIXAR A BIBLIOTECA ORACLEDB 
# use o comando pip install oracledb no CMD


import oracledb
from datetime import datetime

# Configurações da conexão
conexao = oracledb.connect(user="rm551451", password="fiap23", dsn="oracle.fiap.com.br/orcl")

# Função para chamar a procedure insert_bt_telefone
def inserir_bt_telefone(id_telefone, ddi_telefone, ddd_telefone, nr_telefone):
    try:
        with conexao.cursor() as cursor:
            cursor.callproc("insert_bt_telefone", [id_telefone, ddi_telefone, ddd_telefone, nr_telefone])
            print(f"Telefone de ID -> {id_telefone} - número {nr_telefone} registrado com sucesso!")
    except oracledb.Error as e:
        print(f"Erro ao inserir {id_telefone}: {e}")

# Função para chamar a procedure update_bt_telefone
def atualizar_bt_telefone(id_telefone, ddi_telefone, ddd_telefone, nr_telefone):
    try:
        with conexao.cursor() as cursor:
            cursor.callproc("update_bt_telefone", [id_telefone, ddi_telefone, ddd_telefone, nr_telefone])
            print(f"Telefone de ID -> {id_telefone} - número {nr_telefone} atualizado com sucesso!")
    except oracledb.Error as e:
        print(f"Erro ao atualizar {id_telefone}: {e}")


# Função para chamar a procedure delete_bt_categoria
def deletar_bt_telefone(id_telefone):
    try:
        with conexao.cursor() as cursor:
            # Cria um array para armazenar o valor de nr_telefone
            nr_telefone = cursor.var(oracledb.STRING)
            cursor.callproc("delete_bt_telefone", [id_telefone, nr_telefone])
            print(f"Telefone de ID -> {id_telefone} - número {nr_telefone.getvalue()} apagado com sucesso!")
    except oracledb.Error as e:
        print(f"Erro ao deletar telefone {id_telefone}: {e}")

def inserir_bt_produto(id_produto, nm_produto, desc_produto, vl_produto, dt_fab_produto, dt_validade, dt_cadastro, img_produto):
    try:
        with conexao.cursor() as cursor:
            cursor.callproc("insert_bt_produto", [
                id_produto, nm_produto, desc_produto, vl_produto,
                dt_fab_produto, dt_validade, dt_cadastro, img_produto
            ])
            print(f"Produto de ID {id_produto}, Nome: {nm_produto} inserido com sucesso!")
    except oracledb.Error as e:
        print(f"Erro ao inserir produto {id_produto}: {e}")

# Função para chamar a procedure update_bt_produto
def atualizar_bt_produto(id_produto, nm_produto, desc_produto, vl_produto, dt_fab_produto, dt_validade, dt_cadastro, img_produto):
    try:
        with conexao.cursor() as cursor:
            cursor.callproc("update_bt_produto", [
                id_produto, nm_produto, desc_produto, vl_produto,
                dt_fab_produto, dt_validade, dt_cadastro, img_produto
            ])
            print(f"Produto de ID {id_produto}, Nome: {nm_produto} atualizado com sucesso!")
    except oracledb.Error as e:
        print(f"Erro ao atualizar produto {id_produto}: {e}")



# Função para chamar a procedure delete_bt_categoria
def deletar_bt_produto(id_produto):
    try:
        with conexao.cursor() as cursor:
            # Cria um array para armazenar o valor de nm_produto
            nm_produto = cursor.var(oracledb.STRING)
            cursor.callproc("delete_bt_produto", [id_produto, nm_produto])
            print(f"Produto de ID: {id_produto} - Nome: {nm_produto.getvalue()} deletado com sucesso!")
    except oracledb.Error as e:
        print(f"Erro ao deletar produto {id_produto}: {e}")
try:
    # Inserindo dados
    inserir_bt_telefone(6, 55, 11, 999999999)
    inserir_bt_telefone(7, 1, 14, 123456789)
    inserir_bt_telefone(8, 44, 20, 987654321)

    # Atualizando dados
    atualizar_bt_telefone(1, 55, 11, 888888888)
    atualizar_bt_telefone(2, 1, 17, 987654321)
    atualizar_bt_telefone(3, 55, 19, 973661158)
    

    deletar_bt_telefone(6)
    deletar_bt_telefone(7)
    deletar_bt_telefone(8)
# Inserindo dados
    inserir_bt_produto(6, "Shampoo L´Roche Possay", "Shampoo de altíssima qualidade", 85.0, datetime(2023, 1, 18), datetime(2025, 1, 18), datetime(2024, 5, 18), "l´roche_possay_shampoo.jpg")
    inserir_bt_produto(7, "Condicionador Amend", "Condicionador de alta qualidade ", 50.0, datetime(2023, 2, 1), datetime(2026, 8, 1), datetime(2024, 5, 18), "Amend_shampoo.jpg")
    inserir_bt_produto(8, "Esmalte vermelho risque", "Esmalte na cor vermelha da marca risque", 12.0, datetime(2023, 9, 1), datetime(2024, 9, 11), datetime(2024, 5, 18), "risque_vermelho.jpg")
    inserir_bt_produto(9, "Hidratante Corporal Monange ", "Hidratante Monange com qualidade duvidosa", 20.0, datetime(2023, 4, 18), datetime(2030, 4, 18), datetime(2024, 5, 18), "hidratante_corporal_monange.jpg")
    inserir_bt_produto(10, "Protetor solar L´oreal Paris", "Protetor solar de altissima qualidade", 80.0, datetime(2023, 7, 2), datetime(2025, 7, 2), datetime(2024, 5, 18), "protetor_solar_loreal.jpg")

    # Atualizando dados
    atualizar_bt_produto(1, "Shampoo Dove Intensivo", "Shampoo Dove para cabelos danificados", 17.0, datetime(2023, 8, 16), datetime(2025, 8, 26), datetime(2024, 5, 18), "img_shampoo_dove_intensivo.jpg")
    atualizar_bt_produto(2, "Condicionador SalonLine Intensivo", "Condicionador SalonLine para cabelos danificados", 22.0, datetime(2023, 2, 11), datetime(2025, 2, 11), datetime(2024, 5, 18), "img_condicionador_SalonLine.jpg")
    atualizar_bt_produto(3, "Creme Neutrogena Nutritivo", "Creme nutritivo Neutrogena para a pele", 28.0, datetime(2023, 11, 8), datetime(2025, 11, 8), datetime(2024, 5, 18), "img_creme_Neutrogena_nutritivo.jpg")
    atualizar_bt_produto(4, "Sabonete Asepxia Esfoliante", "Sabonete Asepxia com micropartículas esfoliantes", 20.0, datetime(2024, 4, 15), datetime(2024, 10, 15), datetime(2024, 5, 18), "img_sabonete_Asepxia_esfoliante.jpg")
    atualizar_bt_produto(5, "Desodorante Above Fresh", "Desodorante Above em spray com fragrância fresca", 15.0, datetime(2023, 7, 8), datetime(2028, 8, 7), datetime(2024, 5, 18), "img_desodorante_Above_fresh.jpg")
# Deletando produtos
    deletar_bt_produto(6)
    deletar_bt_produto(7)
    deletar_bt_produto(8)
    deletar_bt_produto(9)
    deletar_bt_produto(10)

finally:
    # Fechando a conexão
    conexao.close()
    print("Conexão fechada.")