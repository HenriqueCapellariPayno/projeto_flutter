import 'package:flutter/material.dart';

// Tela inicial do aplicativo Muhen após o login
class MuhenHomeView extends StatefulWidget {
  const MuhenHomeView({super.key});

  @override
  State<MuhenHomeView> createState() => _MuhenHomeViewState();
}

class _MuhenHomeViewState extends State<MuhenHomeView> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _itensCarrinho = []; // Lista para armazenar os itens do carrinho

  void adicionarAoCarrinho(String nome, String preco, String imagePath) {
  setState(() {
    _itensCarrinho.add({
      'nome': nome,
      'preco': preco,
      'imagePath': imagePath,
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        // Tela Home
        break;
      case 1:
        // Navegar Meus Pedidos
        Navigator.pushNamed(context, 'meus_pedidos');
        break;
      case 2:
        // Navegar para Conta
        Navigator.pushNamed(context, 'conta');
        break;
    }
  }
  
  final List<String> _productNames = [
    'Smartphone',
    'Camiseta',
    'Livro',
    'Bola de futebol',
    'Fone de Ouvido',
    'Relógio',
    'Mochila',
    'Câmera',
  ];

  final List<String> _productImages = [
    'image/smartphone.jpg',
    'image/camiseta.jpg',
    'image/livro.jpg',
    'image/bola.jpg',
    'image/fone.jpg',
    'image/relogio.jpg',
    'image/mochila.jpg',
    'image/camera.jpg',
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        title: const Text('Muhen'),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              // Ação para abrir o carrinho
              Navigator.pushNamed(context, 'carrinho');
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // Ação para abrir configurações
              Navigator.pushNamed(context, 'configuracoes');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            TextField(
              decoration: InputDecoration(
              hintText: 'Buscar produtos...',
              prefixIcon: const Icon(Icons.search, color: Colors.green),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Categorias',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _buildCategoryCard('Eletrônicos', Icons.devices, iconColor: Colors.blue),
                _buildCategoryCard('Roupas', Icons.checkroom, iconColor:Colors.black),
                _buildCategoryCard('Livros', Icons.book, iconColor: Colors.amber),
                _buildCategoryCard('Esportes', Icons.sports, iconColor: Colors.red),
              ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Produtos em destaque',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 250,
              ),
              itemCount: _productNames.length,
              itemBuilder: (context, index) {
                return _buildProductCard(
                  _productNames[index], // Nome do produto
                  'R\$ ${(index + 1) * 10}', // Preço do produto
                  _productImages[index], // Caminho da imagem do produto
      );
              },
              ),
            ),
            ],
          
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.green),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt, color: Colors.green),
            label: 'Meus Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.green),
            label: 'Conta',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon, {Color iconColor = Colors.green}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: iconColor),
            const SizedBox(height: 5),
            Text(title, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(String name, String price, String imagePath) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 80, // Altura da imagem
              width: 80,  // Largura da imagem
              fit: BoxFit.cover, // Ajusta a imagem para cobrir o espaço
            ),
            const SizedBox(height: 10),
            Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(price, style: const TextStyle(fontSize: 14, color: Colors.green)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.red),
                  onPressed: () {
                  // Ação para curtir o produto
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$name adicionado aos favoritos!')),
                  );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.add_shopping_cart, color: Colors.green),
                  onPressed: () {
                  // Ação para adicionar ao carrinho
                  
                  Navigator.pushNamed(
                  context, 
                  'carrinho',
                  arguments: _itensCarrinho,
                  );
                  adicionarAoCarrinho(name, price, imagePath);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$name adicionado ao carrinho!')),
                  );
                  },
                ),
                
          ],
              
            ),
          ],
        ),
      ),
    );
  }
}
