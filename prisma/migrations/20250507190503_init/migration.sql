-- CreateTable
CREATE TABLE "Usuario" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "email" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Pedido" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nomeCliente" TEXT NOT NULL,
    "telefone" INTEGER NOT NULL,
    "cidade" TEXT NOT NULL,
    "endereco" TEXT NOT NULL,
    "criadoEm" DATETIME NOT NULL,
    "observacoes" TEXT,
    "valorTotal" REAL NOT NULL
);

-- CreateTable
CREATE TABLE "TipoPizza" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "somaPreco" REAL NOT NULL
);

-- CreateTable
CREATE TABLE "PizzaPedida" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "pedidoId" INTEGER NOT NULL,
    "tipoId" INTEGER NOT NULL,
    "valor" REAL NOT NULL,
    CONSTRAINT "PizzaPedida_pedidoId_fkey" FOREIGN KEY ("pedidoId") REFERENCES "Pedido" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "PizzaPedida_tipoId_fkey" FOREIGN KEY ("tipoId") REFERENCES "TipoPizza" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Sabor" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "ingredientes" TEXT NOT NULL,
    "precoBase" REAL NOT NULL
);

-- CreateTable
CREATE TABLE "SaborPedido" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "saborId" INTEGER NOT NULL,
    "pizzaPedidaId" INTEGER NOT NULL,
    CONSTRAINT "SaborPedido_saborId_fkey" FOREIGN KEY ("saborId") REFERENCES "Sabor" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "SaborPedido_pizzaPedidaId_fkey" FOREIGN KEY ("pizzaPedidaId") REFERENCES "PizzaPedida" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_email_key" ON "Usuario"("email");
