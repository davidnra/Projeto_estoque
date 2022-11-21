<?php
namespace App\Controllers;
use App\Core\Controller;
use App\Core\Model;
use App\Models\Products;
use App\Models\Stock;
use App\Helper\Helper;
use App\Models\Entry;

class dashboardController extends Controller 
{

	public function index() 
	{
		$model = new Model();
		$product = new Products();
		$stock = new Stock();
		$helper = new Helper();
		$entry = new Entry();

		//Verificando se fez o login caso contrario redireciona para login
		if(!isset($_SESSION['loggedin']) || empty($_SESSION['loggedin'])) { 
			header("Location: ".BASE_URL."/login");
		}
		//--------------------------------------------------------------------------
		$all_entry = $stock->select_a_column_larger_than('entry', 'quant_product', 0);
		$validity = $entry->select_validity();
		//Verifica em Entry se há algum produto com a quantidade igual ou menor que 5
		$low_stock = $stock->low_stock();

		//Verifica se a quantidade é igual a zero para deletar
		$stock->quant_product_equal_zero($low_stock);

		//Verificando quais produtos estão perto de vencer a validade
		$winning_products  = $stock->validity_running_out($validity);
		//Envia os dados para a view
		$dados['name_title'] = "Controle de estoque | Patricia Gomes";
		$dados['helper'] = $helper;
		$dados['low_stock'] = $low_stock;
		$dados['winning_products'] = $winning_products;	
		$dados['all_entry'] = $all_entry;

		$this->load_template('panel', $dados);
	}

	public function validity() 
	{
		$model = new Model();
		$stock = new Stock();
		$entry = new Entry();

		//--------------------------------------------------------------------------
		$validity = $entry->Select_All('entry');

		//Verificando quais produtos estão perto de vencer a validade
		$winning_products  = $stock->validity_running_out($validity);

		//Envia os dados para a view
		$dados['name_title'] = "Validade| Controle de estoque";
		$dados['winning_products'] = $winning_products;

		$this->load_template('validity', $dados);
	}
}