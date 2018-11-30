Received: from mga04.intel.com ([192.55.52.120]:43555 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23992066AbeK3T1lr0EiU (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 30 Nov 2018 20:27:41 +0100
From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH RFC 00/15] Zero ****s, hugload of hugs <3
Date: Fri, 30 Nov 2018 11:27:09 -0800
Message-Id: <20181130192737.15053-1-jarkko.sakkinen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-Path: <jarkko.sakkinen@intel.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-kernel@vger.kernel.org
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Amir Goldstein <amir73il@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Axtens <dja@axtens.net>, David Miller <davem@davemloft.net>, Dominik Brodowski <linux@dominikbrodowski.net>, "open list:DRM DRIVER FOR NVIDIA
        GEFORCE/QUADRO GPUS" <dri-devel@lists.freedesktop.org>, Eric Dumazet <edumazet@google.com>, Federico Vaga <federico.vaga@vaga.pv.it>, Geert Uytterhoeven <geert+renesas@glider.be>, Helge Deller <deller@gmx.de>, Jonathan Corbet <corbet@lwn.net>, Joshua Kinard <kumba@gentoo.org>, Kees Cook <keescook@chromium.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:INOTIFY" <linux-fsdevel@vger.kernel.org>, "open list:IDE SUBSYSTEM" <linux-ide@vger.kernel.org>, "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>, "open list:MEDIA INPUT INFRASTRUCTURE
        V4L/DVB" <linux-media@vger.kernel.org>, "open list:MIPS" <linux-mips@linux-mips.org>, "open list:MEMORY TECHNOLOGY DEVICES
        MTD" <linux-mtd@lists.infradead.org>, "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>, "open list:CPU FREQUENCY DRIVERS" <linux-pm@vger.kernel.org>, "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, "open list:DRM DRIVER FOR NVIDIA
        GEFORCE/QUADRO GPUS" <nouveau@lists.freedesktop.org>, Paolo Abeni <pabeni@redhat.com>, Paul Burton <paul.burton@mips.com>, Petr Mladek <pmladek@suse.com>, Rob Herring <robh@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Shannon Nelson <shannon.nelson@oracle.com>, Stefano Brivio <sbrivio@redhat.com>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>, "Tobin C. Harding" <me@tobin.cc>, Toshiaki Makita <makita.toshiaki@lab.ntt.co.jp>, Willem de Bruijn <willemb@google.com>, Yonghong Song <yhs@fb.com>, Zhu Yanjun <yanjun.zhu@oracle.com>

In order to comply with the CoC, replace **** with a hug.

Jarkko Sakkinen (15):
  MIPS: replace **** with a hug
  Documentation: replace **** with a hug
  drm/nouveau: replace **** with a hug
  m68k: replace **** with a hug
  parisc: replace **** with a hug
  cpufreq: replace **** with a hug
  ide: replace **** with a hug
  media: replace **** with a hug
  mtd: replace **** with a hug
  net/sunhme: replace **** with a hug
  scsi: replace **** with a hug
  inotify: replace **** with a hug
  irq: replace **** with a hug
  lib: replace **** with a hug
  net: replace **** with a hug

 Documentation/kernel-hacking/locking.rst      |  2 +-
 arch/m68k/include/asm/sun3ints.h              |  2 +-
 arch/mips/pci/ops-bridge.c                    | 24 +++++++++----------
 arch/mips/sgi-ip22/ip22-setup.c               |  2 +-
 arch/parisc/kernel/sys_parisc.c               |  2 +-
 drivers/cpufreq/powernow-k7.c                 |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/bios/init.c   |  2 +-
 .../nouveau/nvkm/subdev/pmu/fuc/macros.fuc    |  2 +-
 drivers/ide/cmd640.c                          |  2 +-
 drivers/media/i2c/bt819.c                     |  8 ++++---
 drivers/mtd/mtd_blkdevs.c                     |  2 +-
 drivers/net/ethernet/sun/sunhme.c             |  4 ++--
 drivers/scsi/qlogicpti.h                      |  2 +-
 fs/notify/inotify/inotify_user.c              |  2 +-
 kernel/irq/timings.c                          |  2 +-
 lib/vsprintf.c                                |  2 +-
 net/core/skbuff.c                             |  2 +-
 17 files changed, 33 insertions(+), 31 deletions(-)

-- 
2.19.1
