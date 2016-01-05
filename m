Received: from mailapp01.imgtec.com ([195.59.15.196]:45623 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009774AbcAEAqK6eup5 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 5 Jan 2016 01:46:10 +0100
Message-ID: <568B124A.7040305@imgtec.com>
Date: Mon, 4 Jan 2016 16:46:02 -0800
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH backport v3.15..v4.1 1/2] MIPS: uaccess: Take EVA into
 account in __copy_from_user()
References: <1451939344-21557-1-git-send-email-james.hogan@imgtec.com> <1451939344-21557-2-git-send-email-james.hogan@imgtec.com> <568AE53F.80103@imgtec.com> <20160104222822.GJ17861@jhogan-linux.le.imgtec.org>
In-Reply-To: <20160104222822.GJ17861@jhogan-linux.le.imgtec.org>
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
Cc: stable@vger.kernel.org, Tom Herbert <therbert@google.com>, Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20160105004602.L3MVqerF0MDKR2KUNAq8u_uacBI3K_8uNn450TEK448@z>

On 01/04/2016 02:28 PM, James Hogan wrote:
> Hi Leonid,
>
> On Mon, Jan 04, 2016 at 01:33:51PM -0800, Leonid Yegoshin wrote:
>> On 01/04/2016 12:29 PM, James Hogan wrote:
>>> Add the eva_kernel_access() check in __copy_from_user() like the one in
>>> copy_from_user().
> ...
>
>> Adding a user space check in __copy_from_user() kills the original
>> design.
> The original patch which did the same thing is already merged, so its a
> bit late to be arguing with it now.
>
> In any case, like other __ prefixed uaccess functions I believe the
> semantics are such that __copy_from_user() can be used instead of
> copy_from_user() to avoid multiple redundant access_ok() checks, since
> the caller can do it once before calling __copy_from_user().

... and it seems ridiculous that all net code uses copy_from*() besides 
one place which uses __copy_from_user_nocache() right after access_ok(). 
Note - there is no any saving because of splitting address verification 
into access_ok() from copy*() in this specific case.


>
> I have yet to see evidence or documentation suggesting that it was
> intended never to be used for kernel addresses, which would be
> inconsistent with copy_from_user and other __ uaccess functions which do
> handle them. Given the awkwardness of auditing whether some of these
> functions are ever called with kernel addresses, and the rate of code
> change in Linux, taking shortcuts with the semantics, even if possible
> to do at this moment, will only result in future code rot.

Well, there are cases then you know inside caller that address is kernel 
address space and wants just skip ds set/restore and access_ok(). But it 
is not a case of skb_do_copy_data_nocache().

- Leonid.

>
> Cheers
> James
