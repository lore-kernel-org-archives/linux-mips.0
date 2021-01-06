Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35016C433E0
	for <linux-mips@archiver.kernel.org>; Wed,  6 Jan 2021 20:29:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F230A2313F
	for <linux-mips@archiver.kernel.org>; Wed,  6 Jan 2021 20:29:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbhAFU3d (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 6 Jan 2021 15:29:33 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:58202 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726655AbhAFU3d (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Jan 2021 15:29:33 -0500
Date:   Wed, 06 Jan 2021 20:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1609964930; bh=SEcJEYlogdS7Rm1Ra3IfaXQRRP547iaFsSnUQcDN8PQ=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=lNVn8GyejzywUtXRPJXjXM1HhMAx8VJZpL4SurVQp06rwRg9lnOZIdwtG9QuDLsYU
         56/z1w+Y+TWn1rCr7G2D84U20omS2QgOi085OYaecOSRBEAT9UoQEibsKjnTF1dDEF
         hcHvQwGPCm9uQ0DRsjxwPrZWCAq5X+1iOFXIcHUGcdwF4LlxTNK1SnmBY2B8pL/Byc
         COhvu4caJkcCuAyHc/J+ksDcpM3sku4gHSS5q782lYrR5JPzhWiPCzDot3T5oCtrSP
         xqNnQuLH5uvTMPKRefSh/2WCOukEJLZbM1SeawEmEyiCN7mw0zhYExr8KtSbfhb1dW
         Faub7FhPGZjfg==
To:     Nathan Chancellor <natechancellor@gmail.com>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kees Cook <keescook@chromium.org>,
        Fangrui Song <maskray@google.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alex Smith <alex.smith@imgtec.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Markos Chandras <markos.chandras@imgtec.com>,
        linux-mips@vger.kernel.org, stable@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: Re: [PATCH v2 mips-next 3/4] MIPS: vmlinux.lds.S: catch bad .got, .plt and .rel.dyn at link time
Message-ID: <20210106202831.33419-1-alobakin@pm.me>
In-Reply-To: <20210106200801.31993-3-alobakin@pm.me>
References: <20210106200713.31840-1-alobakin@pm.me> <20210106200801.31993-1-alobakin@pm.me> <20210106200801.31993-3-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Nathan Chancellor <natechancellor@gmail.com>
Date: Wed, 6 Jan 2021 13:23:24 -0700

On Wed, Jan 06, 2021 at 08:08:29PM +0000, Alexander Lobakin wrote:
>> Catch any symbols placed in .got, .got.plt, .plt, .rel.dyn
>> or .rela.dyn and check for these sections to be zero-sized
>> at link time.
>>
>> At least two of them were noticed in real builds:
>>
>> mips-alpine-linux-musl-ld: warning: orphan section `.rel.dyn'
>> from `init/main.o' being placed in section `.rel.dyn'
>>
>> ld.lld: warning: <internal>:(.got) is being placed in '.got'
>>
>> Adopted from x86/kernel/vmlinux.lds.S.
>>
>> Reported-by: Nathan Chancellor <natechancellor@gmail.com> # .got
>> Suggested-by: Fangrui Song <maskray@google.com> # .rel.dyn
>> Signed-off-by: Alexander Lobakin <alobakin@pm.me>
>> ---
>>  arch/mips/kernel/vmlinux.lds.S | 35 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.l=
ds.S
>> index 5d6563970ab2..05eda9d9a7d5 100644
>> --- a/arch/mips/kernel/vmlinux.lds.S
>> +++ b/arch/mips/kernel/vmlinux.lds.S
>> @@ -227,4 +227,39 @@ SECTIONS
>>  =09=09*(.pdr)
>>  =09=09*(.reginfo)
>>  =09}
>> +
>> +=09/*
>> +=09 * Sections that should stay zero sized, which is safer to
>> +=09 * explicitly check instead of blindly discarding.
>> +=09 */
>> +
>> +=09.got : {
>> +=09=09*(.got)
>> +=09=09*(.igot.*)
>> +=09}
>> +=09ASSERT(SIZEOF(.got) =3D=3D 0, "Unexpected GOT entries detected!")
>
> This assertion does trigger now.
>
> $ make -skj"$(nproc)" ARCH=3Dmips CROSS_COMPILE=3Dmipsel-linux-gnu- LLVM=
=3D1 \
>        O=3Dout/mipsel distclean malta_kvm_guest_defconfig all
> ...
> ld.lld: error: Unexpected GOT entries detected!
> ld.lld: error: Unexpected GOT entries detected!
> ...

Oops. I'll build my kernel with LLVM stack and dig into it deeper
tomorrow.

>> +=09.got.plt (INFO) : {
>> +=09=09*(.got.plt)
>> +=09}
>> +=09ASSERT(SIZEOF(.got.plt) =3D=3D 0, "Unexpected GOT/PLT entries detect=
ed!")
>> +
>> +=09.plt : {
>> +=09=09*(.plt)
>> +=09=09*(.plt.*)
>> +=09=09*(.iplt)
>> +=09}
>> +=09ASSERT(SIZEOF(.plt) =3D=3D 0, "Unexpected run-time procedure linkage=
s detected!")
>> +
>> +=09.rel.dyn : {
>> +=09=09*(.rel.*)
>> +=09=09*(.rel_*)
>> +=09}
>> +=09ASSERT(SIZEOF(.rel.dyn) =3D=3D 0, "Unexpected run-time relocations (=
.rel) detected!")
>> +
>> +=09.rela.dyn : {
>> +=09=09*(.rela.*)
>> +=09=09*(.rela_*)
>> +=09}
>> +=09ASSERT(SIZEOF(.rela.dyn) =3D=3D 0, "Unexpected run-time relocations =
(.rela) detected!")
>>  }
>> --
>> 2.30.0

Thanks,
Al

