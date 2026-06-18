# flutter_project_template

A  common general Flutter project template.

## 项目介绍

该项目是同一个通用的flutter项目，该项目具备以下特质：

- 可测试性：data/repositories 和 domain 可以轻松进行单元测试（Mock）。

- 可维护性：修改“登录”页面不会影响“首页”的代码。

- 可扩展性：未来增加新功能，只需在 features/ 下新建文件夹并遵守相同分层规则即可。

## 项目结构设计

```text
lib/
├── main.dart                      # 入口，只负责启动
├── app/                           # 应用全局配置
│   ├── app_widget.dart            # 根 Widget
│   ├── routes.dart                # 路由表
│   └── themes.dart                # 全局主题
├── core/                          # 核心基础设施（与业务无关）
│   ├── network/                   # Dio 封装、拦截器
│   ├── storage/                   # 本地存储封装
│   ├── constants/                 # 全局常量（如 Asset 路径）
│   └── extensions/                # Dart 扩展方法
├── features/                      # 【核心】业务功能集合
│   ├── auth/                      # 认证功能模块
│   │   ├── data/                  # 数据层
│   │   │   ├── models/            # 登录请求/响应模型
│   │   │   └── repositories/      # 登录仓库（调用 API）
│   │   ├── domain/                # 业务逻辑层（可选，复杂业务加此层）
│   │   ├── presentation/          # 界面层（MVC/MVVM）
│   │   │   ├── pages/             # 登录页
│   │   │   ├── widgets/           # 登录专属组件（如验证码输入框）
│   │   │   └── controllers/       # 状态管理（GetX/Provider）
│   │   └── index.dart             # 模块导出（Barrel File）
│   ├── home/                      # 首页功能模块（同理）
│   │   └── presentation/
│   └── settings/                  # 设置模块
├── shared/                        # 跨模块共享资源
│   ├── widgets/                   # 全局公共 UI（Button、Dialog）
│   └── utils/                     # 全局工具函数（防抖、计算）
└── assets/                        # 静态资源（保持不变）
    ├── fonts/
    └── images/
```

## 启动项目

要启动此 Flutter 项目，请按照以下步骤操作：

1. 确保您已安装 Flutter SDK。您可以通过运行 `flutter doctor` 来检查安装状态。
2. 克隆此项目到本地：
   ```bash
   git clone https://github.com/djsun260512-ops/flutter-project-template.git
   ```
3. 进入项目目录：
   ```bash
   cd flutter-project-template
   ```
4. 获取依赖：
   ```bash
   flutter pub get
   ```
5. 运行项目：
   ```bash
   flutter run -d chrome
   flutter run -d ios
   flutter run -d android
   ```

确保您的设备已连接并处于可用状态，您可以使用 `flutter devices` 命令查看可用设备列表。


## 打包 APK

要打包此 Flutter 项目为 APK，请按照以下步骤操作：

1. 确保您已在`pubspec.yaml` 或 `android/app/build.gradle` 文件中配置了应用的版本号和版本名称。
2. 运行以下命令以生成 APK：
   ```bash
   flutter build apk
   flutter build ios
   ```
3. 构建完成后，您可以在 `build/app/outputs/flutter-apk/` 目录中找到生成的 APK 文件。

您可以将 APK 文件安装到 Android 设备上进行测试。