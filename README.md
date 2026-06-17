# flutter_project_template

A  common general Flutter project template.

## 项目介绍

该项目是同一个通用的flutter项目，该项目具备以下特质：

- 可测试性：data/repositories 和 domain 可以轻松进行单元测试（Mock）。

- 可维护性：修改“登录”页面不会影响“首页”的代码。

- 可扩展性：未来增加新功能，只需在 features/ 下新建文件夹并遵守相同分层规则即可。

## 项目结构设计
## 📁 项目结构

```text
lib/
├── main.dart
├── core/                          # 核心基础层
│   ├── constants/                 # 常量
│   ├── extensions/                # 扩展方法
│   ├── themes/                    # 主题/配色
│   └── router/                    # 路由
├── services/                      # 服务层
│   ├── network/                   # 网络基础
│   │   └── dio_client.dart
│   ├── api/                       # 具体接口
│   │   └── login_api.dart
│   └── storage/                   # 本地存储
├── shared/                        # 全局复用组件
│   ├── widgets/                   # 公共 UI 组件
│   └── utils/                     # 纯函数工具
├── features/                      # 按功能模块划分
│   ├── login/                     
│   │   ├── pages/
│   │   ├── controllers/          
│   │   └── models/               
│   └── home/                     
│       ├── pages/
│       └── widgets/               
├── middlewares/                   # 中间件
└── assets/                        # 静态资源
    ├── fonts/
    └── images/
```