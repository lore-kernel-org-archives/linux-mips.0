Received: from multi.imgtec.com ([194.200.65.239]:15812 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6825729Ab3FURCDFHRFK (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 21 Jun 2013 19:02:03 +0200
Message-ID: <51C486DF.4020303@imgtec.com>
Date: Fri, 21 Jun 2013 12:01:19 -0500
From: "Steven J. Hill" <Steven.Hill@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Fix gic_set_affinity infinite loop
References: <20130621111308.GC23231@hades.local>
In-Reply-To: <20130621111308.GC23231@hades.local>
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
To: Tony Wu <tung7970@gmail.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20130621170119.dLxKCdVm-O580Ovy89QOLVZhmcbatUTOZSwBLOoFKQI@z>

On 06/21/2013 06:13 AM, Tony Wu wrote:
> There is an infinite loop in gic_set_affinity. When irq_set_affinity
> gets called on gic controller, it blocks forever.
>
Tony,

What hardware platform is this on and how do you trigger the call to 
'gic_set_affinity' such that you get stuck? Thanks.

-Steve
