Received: from mail-io0-f194.google.com ([209.85.223.194]:45017 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994553AbeHIWlWW4fi9 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 10 Aug 2018 00:41:22 +0200
Received: by mail-io0-f194.google.com with SMTP id q19-v6so6105638ioh.11
        for <linux-mips@linux-mips.org>; Thu, 09 Aug 2018 15:41:22 -0700 (PDT)
Message-ID: <5b6cc309.1c69fb81.63d80.612a@mx.google.com>
Date: Thu, 09 Aug 2018 16:41:12 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 02/18] clk: intel: Add clock driver for Intel MIPS SoCs
References: <20180803030237.3366-1-songjun.wu@linux.intel.com> <20180803030237.3366-3-songjun.wu@linux.intel.com>
In-Reply-To: <20180803030237.3366-3-songjun.wu@linux.intel.com>
Return-Path: <robherring2@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: songjun.wu@linux.intel.com
Cc: hua.ma@linux.intel.com, yixin.zhu@linux.intel.com, chuanhua.lei@linux.intel.com, qi-ming.wu@intel.com, linux-mips@linux-mips.org, linux-clk@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>
Message-ID: <20180809224112.94odRAzNeuHlhZnCc8u9m-cZqJI9IN53YhDm9VcGnOY@z>

Hi, this is an automated email from Rob's (experimental) review bot. I
found a couple of common problems with your patch. Please see below.

On Fri,  3 Aug 2018 11:02:21 +0800, Songjun Wu wrote:
> From: Yixin Zhu <yixin.zhu@linux.intel.com>
> 
> This driver provides PLL clock registration as well as various clock
> branches, e.g. MUX clock, gate clock, divider clock and so on.
> 
> PLLs that provide clock to DDR, CPU and peripherals are shown below:
> 
>                  +---------+
>             |--->| LCPLL3 0|--PCIe clk-->
>    XO       |    +---------+
> +-----------|
>             |    +---------+
>             |    |        3|--PAE clk-->
>             |--->| PLL0B  2|--GSWIP clk-->
>             |    |        1|--DDR clk-->DDR PHY clk-->
>             |    |        0|--CPU1 clk--+   +-----+
>             |    +---------+            |--->0    |
>             |                               | MUX |--CPU clk-->
>             |    +---------+            |--->1    |
>             |    |        0|--CPU0 clk--+   +-----+
>             |--->| PLLOA  1|--SSX4 clk-->
>                  |        2|--NGI clk-->
>                  |        3|--CBM clk-->
>                  +---------+
> 
> Signed-off-by: Yixin Zhu <yixin.zhu@linux.intel.com>
> Signed-off-by: Songjun Wu <songjun.wu@linux.intel.com>

The preferred subject prefix is "dt-bindings: <binding dir>: ...".

> ---
> 
> Changes in v2:
> - Rewrite clock driver, add platform clock description details in
>   clock driver.
> 
>  drivers/clk/Kconfig                          |   1 +
>  drivers/clk/Makefile                         |   3 +
>  drivers/clk/intel/Kconfig                    |  20 ++
>  drivers/clk/intel/Makefile                   |   7 +
>  drivers/clk/intel/clk-cgu-pll.c              | 166 ++++++++++
>  drivers/clk/intel/clk-cgu-pll.h              |  34 ++
>  drivers/clk/intel/clk-cgu.c                  | 470 +++++++++++++++++++++++++++
>  drivers/clk/intel/clk-cgu.h                  | 259 +++++++++++++++
>  drivers/clk/intel/clk-grx500.c               | 168 ++++++++++
>  include/dt-bindings/clock/intel,grx500-clk.h |  69 ++++
>  10 files changed, 1197 insertions(+)
>  create mode 100644 drivers/clk/intel/Kconfig
>  create mode 100644 drivers/clk/intel/Makefile
>  create mode 100644 drivers/clk/intel/clk-cgu-pll.c
>  create mode 100644 drivers/clk/intel/clk-cgu-pll.h
>  create mode 100644 drivers/clk/intel/clk-cgu.c
>  create mode 100644 drivers/clk/intel/clk-cgu.h
>  create mode 100644 drivers/clk/intel/clk-grx500.c
>  create mode 100644 include/dt-bindings/clock/intel,grx500-clk.h
> 

DT bindings (including binding headers) should be a separate patch. See
Documentation/devicetree/bindings/submitting-patches.txt.
