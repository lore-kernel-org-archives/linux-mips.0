Received: from multi.imgtec.com ([194.200.65.239]:29832 "EHLO multi.imgtec.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S6827313Ab3JHMn2XWhqv (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Tue, 8 Oct 2013 14:43:28 +0200
Message-ID: <5253FDFC.80007@imgtec.com>
Date: Tue, 8 Oct 2013 13:43:40 +0100
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH] MIPS: Print correct PC in trace dump after NMI exception
References: <1381232371-25017-1-git-send-email-markos.chandras@imgtec.com> <20131008121546.GI1615@linux-mips.org> <5253FB20.7050909@imgtec.com> <20131008123859.GK1615@linux-mips.org>
In-Reply-To: <20131008123859.GK1615@linux-mips.org>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
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
Cc: linux-mips@linux-mips.org, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Message-ID: <20131008124340.Znz4FyujKzbn73ywppqXVQE1wQKR1ai8avWeeKxB_B8@z>



markos

On 10/08/13 13:38, Ralf Baechle wrote:
> On Tue, Oct 08, 2013 at 01:31:28PM +0100, Markos Chandras wrote:
>
>>> If you were afraid gas might use $1 expanding this macro instruction - no,
>>> it won't.  A belt & suspenders approach might be to drop in a ".set noat";
>>> it would make the assembler throw an error if should ever see the need to
>>> use $1.
>>>
>> yeah i don't think the assembler would pick $1 in this case but we
>> could add ".set noat" just to be safe i suppose.
>>
>> Thanks for the review. Could you fix these problems for me or should
>> i submit a new patch?
>
> It's trivial enough so I'm going to do it.
>
> The NMI handler btw. was already wrapped with .set push; .set noat; ...
> .set pop.
>
>    Ralf
>
yeah i just noticed. Thank you!
