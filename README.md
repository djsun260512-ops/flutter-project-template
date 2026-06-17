# flutter_project_template

A  common general Flutter project.

## 项目介绍

该项目是同一个通用的flutter项目，该项目具备以下特质：

- 可测试性：data/repositories 和 domain 可以轻松进行单元测试（Mock）。

- 可维护性：修改“登录”页面不会影响“首页”的代码。

- 可扩展性：未来增加新功能，只需在 features/ 下新建文件夹并遵守相同分层规则即可。

## 项目结构设计
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