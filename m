Received: from mail3.caviumnetworks.com ([12.108.191.235]:4173 "EHLO
        mail3.caviumnetworks.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491931Ab0I0RjV (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 27 Sep 2010 19:39:21 +0200
Message-ID: <4CA0D6C2.7030901@caviumnetworks.com>
Date: Mon, 27 Sep 2010 10:39:14 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: [PATCH 7/9] swiotlb: Make bounce buffer bounds non-static.
References: <1285281496-24696-1-git-send-email-ddaney@caviumnetworks.com>       <1285282051-24907-2-git-send-email-ddaney@caviumnetworks.com> <20100927141616S.fujita.tomonori@lab.ntt.co.jp>
In-Reply-To: <20100927141616S.fujita.tomonori@lab.ntt.co.jp>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, konrad.wilk@oracle.com, mingo@elte.hu, andre.goddard@gmail.comkonrad.wilk@oracle.com
Message-ID: <20100927173914.VbONjINJiS7KOcII0TT0AT6kV9tsAWJa6SZb8VQwMvs@z>

On 09/26/2010 10:20 PM, FUJITA Tomonori wrote:
> On Thu, 23 Sep 2010 15:47:31 -0700
> David Daney<ddaney@caviumnetworks.com>  wrote:
>
>> Octeon PCI mapping has to be established to cover the bounce buffers,
>> so it has to have access to the bounds.
>
> Why can't you use swiotlb_init_with_tbl() instead?
>

Yes, as pointed out be several people, that would be better.

The swiotlb_init_with_tbl() didn't exist in earlier kernel versions and 
this simplification was missed when I forward ported the patch set.

By using this function, I think the entire patch set will be MIPS 
specific, making it unnecessary to touch the generic swiotlb code.

Thanks,
David Daney
