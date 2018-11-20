Received: from mail-eopbgr700126.outbound.protection.outlook.com ([40.107.70.126]:31424
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23990509AbeKTWLMmALt2 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 20 Nov 2018 23:11:12 +0100
From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH V5 2/8] MIPS: c-r4k: Add r4k_blast_scache_node for
 Loongson-3
Date: Tue, 20 Nov 2018 22:11:08 +0000
Message-ID: <MWHPR2201MB1277A98E71BB648FFCAD3232C1D90@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <1542268439-4146-3-git-send-email-chenhc@lemote.com>
In-Reply-To: <1542268439-4146-3-git-send-email-chenhc@lemote.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Return-Path: <pburton@wavecomp.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Huacai Chen <chenhc@lemote.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, James Hogan <james.hogan@mips.com>, "Steven J . Hill" <Steven.Hill@cavium.com>, "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Fuxin Zhang <zhangfx@lemote.com>, Zhangjin Wu <wuzhangjin@gmail.com>, "# 3 . 15+" <stable@vger.kernel.org>"linux-mips@linux-mips.org" <linux-mips@linux-mips.org>
Message-ID: <20181120221108.XQmeYMDKDhZBJ_88ZkNqq0dzWFhbML3rE-lvpFDaOc4@z>

Hello,

Huacai Chen wrote:
> For multi-node Loongson-3 (NUMA configuration), r4k_blast_scache() can
> only flush Node-0's scache. So we add r4k_blast_scache_node() by using
> (CAC_BASE | (node_id << NODE_ADDRSPACE_SHIFT)) instead of CKSEG0 as the
> start address.
> 
> Cc: <stable@vger.kernel.org> # 3.15+
> Signed-off-by: Huacai Chen <chenhc@lemote.com>

Applied to mips-next.

Thanks,
    Paul

[ This message was auto-generated; if you believe anything is incorrect
  then please email paul.burton@mips.com to report it. ]
