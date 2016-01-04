Received: from mailapp01.imgtec.com ([195.59.15.196]:7531 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009752AbcADVeANeywb (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 4 Jan 2016 22:34:00 +0100
Message-ID: <568AE53F.80103@imgtec.com>
Date: Mon, 4 Jan 2016 13:33:51 -0800
From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH backport v3.15..v4.1 1/2] MIPS: uaccess: Take EVA into
 account in __copy_from_user()
References: <1451939344-21557-1-git-send-email-james.hogan@imgtec.com> <1451939344-21557-2-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1451939344-21557-2-git-send-email-james.hogan@imgtec.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
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
To: James Hogan <james.hogan@imgtec.com>, stable@vger.kernel.org, Tom Herbert <therbert@google.com>
Cc: Markos Chandras <markos.chandras@imgtec.com>, Paul Burton <paul.burton@imgtec.com>, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20160104213351.TDXPTsSbEz_mki3P1tqAXQenlK3iYg994MNx8gbqdSw@z>

On 01/04/2016 12:29 PM, James Hogan wrote:
> commit 6f06a2c45d8d714ea3b11a360b4a7191e52acaa4 upstream.
>
> When EVA is in use, __copy_from_user() was unconditionally using the EVA
> instructions to read the user address space, however this can also be
> used for kernel access. If the address isn't a valid user address it
> will cause an address error or TLB exception, and if it is then user
> memory may be read instead of kernel memory.
>
> For example in the following stack trace from Linux v3.10 (changes since
> then will prevent this particular one still happening) kernel_sendmsg()
> set the user address limit to KERNEL_DS, and tcp_sendmsg() goes on to
> use __copy_from_user() with a kernel address in KSeg0.
>
> [<8002d434>] __copy_fromuser_common+0x10c/0x254
> [<805710e0>] tcp_sendmsg+0x5f4/0xf00
> [<804e8e3c>] sock_sendmsg+0x78/0xa0
> [<804e8f28>] kernel_sendmsg+0x24/0x38
> [<804ee0f8>] sock_no_sendpage+0x70/0x7c
> [<8017c820>] pipe_to_sendpage+0x80/0x98
> [<8017c6b0>] splice_from_pipe_feed+0xa8/0x198
> [<8017cc54>] __splice_from_pipe+0x4c/0x8c
> [<8017e844>] splice_from_pipe+0x58/0x78
> [<8017e884>] generic_splice_sendpage+0x20/0x2c
> [<8017d690>] do_splice_from+0xb4/0x110
> [<8017d710>] direct_splice_actor+0x24/0x30
> [<8017d394>] splice_direct_to_actor+0xd8/0x208
> [<8017d51c>] do_splice_direct+0x58/0x7c
> [<8014eaf4>] do_sendfile+0x1dc/0x39c
> [<8014f82c>] SyS_sendfile+0x90/0xf8
>
> Add the eva_kernel_access() check in __copy_from_user() like the one in
> copy_from_user().
>

I think that the best way to fix this problem is - stop 
skb_do_copy_data_nocache() using __copy_from_user_nocache(). All TCP/IP 
stuff (beyond SCTP) doesn't use "accelerated" __copy*() functions. 
Adding a user space check in __copy_from_user() kills the original 
design. And splitting a user space processing in two places 
(skb_do_copy_data_nocache() calls access_ok(), BTW) - and it is also a 
bad thing in my mind.

- Leonid.
