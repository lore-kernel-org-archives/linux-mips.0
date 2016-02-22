Received: from mail.windriver.com ([147.11.1.11]:62138 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007608AbcBVSWOnY5gv (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 22 Feb 2016 19:22:14 +0100
From: Yang Shi <yang.shi@windriver.com>
Subject: Does CN68XX still need DCache prefetch workaround?
Message-ID: <56CB51CE.6070905@windriver.com>
Date: Mon, 22 Feb 2016 10:22:06 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Yang.Shi@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: david.daney@cavium.com
Cc: linux-mips@linux-mips.org
Message-ID: <20160222182206.moIM3lKutV1nDxp58Vz97eAf_dLcQ1MeAahd3D_vqe8@z>

I David,

When I booted up 4.5-rc4 kernel on CN68xx board, both pass 1.1 and pass 
2.2 reports:

Kernel panic - not syncing: OCTEON II DCache prefetch workaround not in 
place (cfa00000).
Please build kernel with proper options (CONFIG_CAVIUM_CN63XXP1).

According to the description of he option, it should just have impact on 
63xx pass 1.x. It looks confusing.

Any hint is appreciated?

Thanks,
Yang
