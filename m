Received: from mailapp02.imgtec.com ([217.156.133.132]:32310 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992197AbcIVVmXiSDV0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 22 Sep 2016 23:42:23 +0200
Message-ID: <57E45037.3030304@imgtec.com>
Date: Thu, 22 Sep 2016 14:42:15 -0700
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH 7/9] MIPS: uprobes: Flush icache via kernel address
References: <cover.d93e43428f3c573bdd18d7c874830705b39c3a8a.1472747205.git-series.james.hogan@imgtec.com> <0d915756776de050b8a92b5bb5d4e7ffbe784d66.1472747205.git-series.james.hogan@imgtec.com> <20160921132656.GF14137@linux-mips.org> <57E2CE5B.8020406@imgtec.com> <20160922211527.GB7352@jhogan-linux.le.imgtec.org> <57E44F59.5050600@imgtec.com>
In-Reply-To: <57E44F59.5050600@imgtec.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Leonid.Yegoshin@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: James Hogan <james.hogan@imgtec.com>
Cc: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20160922214215.x4U4fNDkNoFq2wB189pg5n-fndvDhmSU3xxmCdvftc0@z>

Look into https://patchwork.linux-mips.org/patch/10870/ for definition 
of mips_flush_data_cache_range() for reference.

- Leonid
