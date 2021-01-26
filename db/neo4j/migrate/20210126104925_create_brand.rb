class CreateBrand < ActiveGraph::Migrations::Base
  disable_transactions!

  def up
    add_constraint :Brand, :uuid
  end

  def down
    drop_constraint :Brand, :uuid
  end
end
