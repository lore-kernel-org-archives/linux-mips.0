Received: from mail-by2on0065.outbound.protection.outlook.com ([207.46.100.65]:2416
        "EHLO na01-by2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S27012454AbbHDUjBM6jyi (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 4 Aug 2015 22:39:01 +0200
Message-ID: <55C122D7.3040803@caviumnetworks.com>
Date: Tue, 4 Aug 2015 13:38:47 -0700
From: David Daney <ddaney@caviumnetworks.com>
MIME-Version: 1.0
Subject: Re: MIPS: Make set_pte() SMP safe.
References: <1438649323-1082-1-git-send-email-ddaney.cavm@gmail.com> <55C10F4B.2050003@imgtec.com> <55C11A37.5070509@caviumnetworks.com> <55C1214F.8050208@imgtec.com> <55C12263.7070407@imgtec.com>
In-Reply-To: <55C12263.7070407@imgtec.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Cc: David Daney <ddaney.cavm@gmail.com>, linux-mips@linux-mips.org, ralf@linux-mips.org, David Daney <david.daney@cavium.com>, stable@vger.kernel.org
Message-ID: <20150804203847.Gq0LgpQqP90wwV6dfpH3TbvsVM5sJd5z7jDnzFw6Qbw@z>

On 08/04/2015 01:36 PM, Leonid Yegoshin wrote:
> David,
>
> Note: Excuse me for bothering you but if guard page logic doesn't work
> anymore then it can be scraped. It allows me to optimize some cache
> flushes in VMAP area - instead of flushing a full cache, just flush a
> range of pages.
>

I don't know what the purpose of guard pages is.  I thought it was to 
produce an OOPs message if you accessed just beyond the end of the vmap 
area.  If people are using them for some other reason, then I am not 
aware of it.

David.
