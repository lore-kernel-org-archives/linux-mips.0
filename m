Received: from multi.imgtec.com ([194.200.65.239]:24717 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827473Ab3FZWXrbCF6L (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Thu, 27 Jun 2013 00:23:47 +0200
Message-ID: <51CB69E4.1070900@imgtec.com>
Date: Wed, 26 Jun 2013 17:23:32 -0500
From: "Steven J. Hill" <Steven.Hill@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Fix gic_set_affinity infinite loop
References: <20130621111308.GC23231@hades.local> <51C486DF.4020303@imgtec.com> <20130626190547.GK7171@linux-mips.org>
In-Reply-To: <20130626190547.GK7171@linux-mips.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Steven.Hill@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: Tony Wu <tung7970@gmail.com>, linux-mips@linux-mips.org, Chris Dearman <chris.dearman@imgtec.com>
Message-ID: <20130626222332.j552liBYoVOBuKr5qmrErsa7OtcahRORRk-wnnUHfe0@z>

On 06/26/2013 02:05 PM, Ralf Baechle wrote:
>
> I assume on a SMP GIC configuration he must have tried something like
>
>    echo 1 > /proc/irq/2/smp_affinity
>
> Where 1 is a CPU bit mask and 2 the number of a GIC interrupt of which
> to change the affinity.
>
I confirmed the hang on the Malta board. Tony's patch fixes this. Thank 
you Tony.

Steve
