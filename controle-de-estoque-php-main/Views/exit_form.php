			<div class="col-10 content">

				<!-- Row form insert -->
				<div class="row panel">
					<div class="col-6">
						<form method="POST" action="<?php echo BASE_URL; ?>/exit/register" id="form_exit">
							<?php if(!empty($data_product)) : ?>
							<?php foreach($data_product as $product): ?>
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="exampleFormControlInput1">Nome do produto</label>
										<input type="text" class="form-control" name="name" value="<?php echo $product['name_product']; ?>" required="required">
								    </div>
								    <div class="form-group col-md-3">
										<label for="exampleFormControlInput1">Preço médio</label>
										<input type="text" pattern="([0-9]{1,2}\.)?[0-9]{1,2},[0-9]{2}$" class="form-control" name="value" id="value" value="<?php echo str_replace('.', ',', $product['value_product']); ?>" required="required" placeholder="15,90">
								    </div>
								</div>
							
								<input type="hidden" name="id_entry" value="<?php echo $product['id']; ?>">
							<?php endforeach; ?>
							<?php endif; ?>
							<div class="form-row">
							    <div class="form-group col-md-3">
									<label for="exampleFormControlInput1">Quantidade</label>
									<input type="number" name="quant" class="form-control" id="quant" required="required">
							    </div>
							    <div class="form-group col-md-3">
									<label for="exampleFormControlInput1">Valor total</label>
									<input type="text" pattern="([0-9]{1,3}\.)?[0-9]{1,3},[0-9]{2}$" name="value_total" class="form-control" id="result" required="required">
							    </div>
							</div>
							<div class="form-row">
								<button type="input" class="btn btn-primary">Retirar</button>
							</div>
						</form>
					</div>
				</div><br/><br/>
				<!-- ./Row form insert -->
			</div>
		</div>