# 星辉魔女 · 眼睛修复定稿案例

![星辉魔女成片画面](../../assets/showcase/starlight-witch-final.png)

这是作者已完成的《星辉魔女（逆时空秩序圣女）》成片案例。目录保留桌面“星辉魔女_眼睛修复交付”中的**最终修改版源码**和渲染所需的 `assets/`。它沿用此前发布在 [`manim-handdraw` 案例](https://github.com/FTZ-OPUS/manim-handdraw/tree/main/examples/starlight-witch)中的定稿镜头，仅在本副本的字幕调用中把空字体值改成库的默认字体，以适配当前 Manim；这里没有宣称已用 0.1.1 API 重做整片。

这个案例值得学习的地方是：先从线稿提取大部分笔画，单独修复高度倾斜的双眼；对领口、宝石、发丝等自动提取不准的部位做局部矢量重描；再逐层显示上色素材。眼睛的细节保留了原稿提取的透明墨迹贴片。`starlight_witch.py` 中的坐标和线宽针对这张画，换一张图必须重新测量和检查。

## 运行

先在仓库根目录执行 `bash install.sh`（Windows 使用 `install.ps1`），然后：

```bash
cd examples/starlight-witch
../../.venv/bin/manim -ql starlight_witch.py StarWitch
```

Windows 在本目录运行 `..\..\.venv\Scripts\manim.exe -ql starlight_witch.py StarWitch`。高画质成片可以改用 `-qh --fps 60`。首次提取笔画时会在 `assets/` 写入 `.strokes.npz` 缓存；它是生成文件，不需要下载旧缓存。Manim 与中文字体的系统依赖见仓库根目录 README。

| 文件 | 作用 |
| --- | --- |
| `starlight_witch.py` | 眼睛修复后最终定稿的 Manim 场景，包含局部重描函数 |
| `assets/lineart.png` | 从铅笔稿准备好的线稿，供笔画提取 |
| `assets/left_eye_ink.png`、`right_eye_ink.png`、`bangs_ink.png`、`eye.json`、`mouth.npy` | 五官贴片和位置参数 |
| `assets/lay_*.png`、`full.png` | 分层上色素材与最终彩稿 |

完整 4 分 44 秒视频可在[原手绘库案例页面](https://github.com/FTZ-OPUS/manim-handdraw/tree/main/examples/starlight-witch)观看或下载。此独立技能仓库只收录源码、所需素材与成片截图，避免把同一视频重复上传一份。

本案例的输入是**已经准备好的线稿与色层**，并未附最初的两张原始图片。如果要学习从铅笔稿、彩色稿开始准备新角色，请先看[双图操作示例](../paired-inputs.md)和技能入口 [SKILL.md](../../SKILL.md)。
