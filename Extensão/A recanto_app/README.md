# 🏥 Recanto dos Velhinhos - Aplicativo Mobile

Aplicativo institucional profissional para o Recanto dos Velhinhos de Valinhos, desenvolvido em Flutter.

## 📋 Sobre o Projeto

Aplicativo mobile que apresenta:
- **Informações Institucionais** - Histórico, missão e estrutura
- **Notícias** - Últimas novidades da instituição
- **Eventos** - Calendário e detalhes de eventos
- **Doações** - Formas de contribuir
- **Transparência** - Documentos e informações financeiras
- **Contato** - Formulário e canais de comunicação

## 🎯 Características Principais

✅ **Design System Completo**
- Cores institucionais acolhedoras
- Tipografia moderna e acessível
- Componentes reutilizáveis

✅ **Navegação Fluida**
- GoRouter com rotas type-safe
- Transições suaves
- Erro handling

✅ **Dados Locais (Mock)**
- NewsRepository
- EventRepository  
- ActivityRepository
- Preparado para integração com API

✅ **Acessibilidade**
- Textos legíveis
- Contraste adequado
- Botões grandes
- Navegação intuitiva

✅ **State Management**
- Riverpod para gerenciamento de estado
- Providers centralizados
- Reatividade automática

## 🚀 Como Instalar

### Requisitos
- Flutter 3.0+
- Dart 3.0+
- Android Studio / Xcode
- VS Code (recomendado)

### Passos de Instalação

#### 1️⃣ Clonar o Repositório
```bash
git clone https://github.com/seu-usuario/recanto_app.git
cd recanto_app
```

#### 2️⃣ Instalar Dependências
```bash
flutter pub get
```

#### 3️⃣ Gerar Build Runner (para Riverpod)
```bash
flutter pub run build_runner build
```

#### 4️⃣ Rodar a Aplicação
```bash
# Android
flutter run

# iOS
flutter run -t lib/main.dart

# Web (se habilitado)
flutter run -d chrome
```

## 📁 Estrutura do Projeto

```
lib/
├── core/
│   ├── theme/              # Design system
│   ├── routes/             # Navegação
│   ├── widgets/            # Componentes reutilizáveis
│   ├── constants/          # Constantes da app
│   └── utils/              # Funções utilitárias
│
├── features/
│   ├── splash/             # Splash screen
│   ├── home/               # Home com destaques
│   ├── about/              # Sobre a instituição
│   ├── news/               # Notícias
│   ├── events/             # Eventos
│   ├── donations/          # Doações
│   ├── transparency/       # Portal de transparência
│   └── contact/            # Contato e formulário
│
├── shared/
│   ├── models/             # Modelos de dados
│   ├── data/               # Repositórios
│   └── components/         # Componentes compartilhados
│
└── main.dart               # Entrada da app
```

## 🎨 Design System

### Cores
```dart
AppColors.primary      = #2D5F4F  (Verde institucional)
AppColors.secondary    = #D4A574  (Ouro/bege)
AppColors.accent       = #F0A957  (Laranja suave)
```

### Tipografia
- Display: Para títulos principais
- Headline: Para títulos de seções
- Title: Para títulos de cards
- Body: Para conteúdo principal
- Label: Para rótulos e badges
- Caption: Para textos pequenos

### Espaçamento
```dart
xs = 4px
sm = 8px
md = 12px
lg = 16px
xl = 24px
xxl = 32px
xxxl = 48px
```

## 🔧 Configuração

### Adicionar Novas Rotas

```dart
// Em lib/core/routes/app_router.dart

GoRoute(
  path: 'nova-tela',
  name: 'nova-tela',
  builder: (context, state) => const NovaTelaScreen(),
),
```

### Criar Novo Componente

```dart
// Em lib/core/widgets/novo_widget.dart

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';

class NovoWidget extends StatelessWidget {
  const NovoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Seu widget aqui
    );
  }
}
```

### Adicionar Nova Feature

```
lib/features/nova_feature/
├── nova_feature_screen.dart
├── widgets/
│   └── componentes.dart
└── providers/
    └── providers.dart
```

## 📡 Integração com API

O projeto está preparado para integração com backend. Para integrar uma API real:

### 1. Atualizar Repository

```dart
// Exemplo: news_repository.dart

Future<List<NewsModel>> getAllNews() async {
  try {
    final response = await http.get(
      Uri.parse('https://api.example.com/news'),
    );
    
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => NewsModel.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar notícias');
    }
  } catch (e) {
    rethrow;
  }
}
```

### 2. Adicionar Interceptor (Opcional)

```dart
// lib/core/services/api_service.dart

class ApiService {
  static const String baseUrl = 'https://api.example.com';
  
  static final http.Client _client = http.Client();
  
  static Future<http.Response> get(String endpoint) {
    return _client.get(
      Uri.parse('$baseUrl$endpoint'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
  }
}
```

## 🧪 Testes

### Executar Testes
```bash
flutter test
```

### Exemplo de Teste
```dart
void main() {
  group('AppUtils', () {
    test('formatDate funciona corretamente', () {
      final date = DateTime(2024, 12, 25);
      expect(AppUtils.formatDate(date), '25/12/2024');
    });
  });
}
```

## 📱 Suporte Responsivo

O app é otimizado para:
- **Celulares** (320px - 600px)
- **Tablets** (600px - 1200px)
- **Desktops** (1200px+)

Usa `flutter_screenutil` para responsividade automática.

## 🌐 Conectar com URLs Reais

### WhatsApp
```dart
const whatsappUrl = 'https://wa.me/551938298180';
await launchUrl(Uri.parse(whatsappUrl));
```

### Email
```dart
final Uri emailUri = Uri(
  scheme: 'mailto',
  path: 'contato@recantodosvelhinhos.com.br',
);
await launchUrl(emailUri);
```

### Telefone
```dart
final Uri phoneUri = Uri(scheme: 'tel', path: '551938298180');
await launchUrl(phoneUri);
```

### Mapa
```dart
const mapUrl = 'https://maps.app.goo.gl/LCRgWUGWDYnpagaE7';
await launchUrl(Uri.parse(mapUrl));
```

## 🚀 Deploy

### Android
```bash
flutter build apk --release
flutter build aab --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## 📊 Performance

- ✅ Otimizado para dispositivos antigos (Android 5.0+)
- ✅ Tamanho APK reduzido (~30MB)
- ✅ Carregamento rápido (splash em <3s)
- ✅ Scroll suave com BouncingScrollPhysics

## 🔒 Segurança

- ✅ Sem dados sensíveis hardcoded
- ✅ Validação de entrada em formulários
- ✅ HTTPS para comunicação
- ✅ Proteção contra injeção de código

## 🐛 Troubleshooting

### App não inicia
```bash
flutter clean
flutter pub get
flutter run
```

### Erro de build
```bash
flutter clean
flutter pub cache repair
flutter pub get
flutter run
```

### Hot reload não funciona
- Pressione `R` para hot reload
- Use `CTRL+SHIFT+R` para hot restart completo

## 📚 Documentação

- [Flutter Docs](https://flutter.dev/docs)
- [GoRouter](https://pub.dev/packages/go_router)
- [Riverpod](https://riverpod.dev)
- [Flutter ScreenUtil](https://pub.dev/packages/flutter_screenutil)

## 👥 Contribuir

1. Faça um fork
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

## 📞 Contato

**Recanto dos Velhinhos de Valinhos**
- 📞 (19) 3829-8180
- 📧 contato@recantodosvelhinhos.com.br
- 📍 R. João Bissoto Filho, 2061 - Valinhos, SP
- 🌐 https://recantodosvelhinhos.com.br

## 🙏 Agradecimentos

- Equipe do Recanto dos Velhinhos
- Flutter Community
- Contribuidores

---

**Desenvolvido com ❤️ para a comunidade de Valinhos**

Versão: 1.0.0
Última atualização: 2024