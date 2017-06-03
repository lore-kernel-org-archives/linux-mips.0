Received: from mga14.intel.com ([192.55.52.115]:62713 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S23990511AbdFCGgygLkrf (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Sat, 3 Jun 2017 08:36:54 +0200
Date: Sat, 3 Jun 2017 14:36:42 +0800
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v3 4/7] net: pch_gbe: Add device tree support
Message-ID: <201706031442.vYKOKOkq%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170602234042.22782-5-paul.burton@imgtec.com>
Return-Path: <fengguang.wu@intel.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Paul Burton <paul.burton@imgtec.com>
Cc: kbuild-all@01.org, netdev@vger.kernel.org, Tobias Klauser <tklauser@distanz.ch>, "David S . Miller" <davem@davemloft.net>, Jarod Wilson <jarod@redhat.com>, linux-mips@linux-mips.org, Eric Dumazet <edumazet@google.com>
Message-ID: <20170603063642.srHhf5bGz_cTk5i1O7WQbPhfAHaC-5_-Z3oQeAvq4Pg@z>

Hi Paul,

[auto build test WARNING on net-next/master]
[also build test WARNING on v4.12-rc3 next-20170602]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Paul-Burton/net-pch_gbe-Fixes-MIPS-support/20170603-112042


coccinelle warnings: (new ones prefixed by >>)

>> drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c:2587:9-16: WARNING: ERR_CAST can be used with gpio

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
