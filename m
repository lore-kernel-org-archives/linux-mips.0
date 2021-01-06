Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656A2C433E0
	for <linux-mips@archiver.kernel.org>; Wed,  6 Jan 2021 20:10:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34AC723132
	for <linux-mips@archiver.kernel.org>; Wed,  6 Jan 2021 20:10:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbhAFUKO (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 6 Jan 2021 15:10:14 -0500
Received: from mail-03.mail-europe.com ([91.134.188.129]:41506 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbhAFUKO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Jan 2021 15:10:14 -0500
Date:   Wed, 06 Jan 2021 20:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1609963729; bh=6daANB2TdyPWX84b10kSOB7FgmMFj+I2EXYLQzC8gJ4=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=TkLX+2cYrliZ7AE5My32Qk4RkH4BfJnd4n9ged0uMiGci5zxNJ4Sg5qJvIOAL8EbL
         kqi62uleA/uWUErUm0/NidwKUafttFxjzfYY9TSf9NC2kfG58beRzR/4TAQnSnk03k
         6pWmWasRk9Tc5B5rvuK/GHXeXIuW5YJH2Vm7l6TDVtsJ1HXNhomzAy/Ld+VGDusd1f
         Dk18DmfBMUbjoxb//UNi0/jgTDQW8xBO45uXh3tk5UR/euvz3YAVfAK+RWPE+F4uWJ
         mMLNFjmcV2Ei9AA+P/dc1VOKE6YVjXiY+WD7JmX4uCMC9QBrKu6GsUKjyhPvV58WJ6
         G3UosHlozAnsA==
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexander Lobakin <alobakin@pm.me>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Fangrui Song <maskray@google.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Alex Smith <alex.smith@imgtec.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Markos Chandras <markos.chandras@imgtec.com>,
        linux-mips@vger.kernel.org, stable@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH v2 mips-next 3/4] MIPS: vmlinux.lds.S: catch bad .got, .plt and .rel.dyn at link time
Message-ID: <20210106200801.31993-3-alobakin@pm.me>
In-Reply-To: <20210106200801.31993-1-alobakin@pm.me>
References: <20210106200713.31840-1-alobakin@pm.me> <20210106200801.31993-1-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Catch any symbols placed in .got, .got.plt, .plt, .rel.dyn
or .rela.dyn and check for these sections to be zero-sized
at link time.

At least two of them were noticed in real builds:

mips-alpine-linux-musl-ld: warning: orphan section `.rel.dyn'
from `init/main.o' being placed in section `.rel.dyn'

ld.lld: warning: <internal>:(.got) is being placed in '.got'

Adopted from x86/kernel/vmlinux.lds.S.

Reported-by: Nathan Chancellor <natechancellor@gmail.com> # .got
Suggested-by: Fangrui Song <maskray@google.com> # .rel.dyn
Signed-off-by: Alexander Lobakin <alobakin@pm.me>
---
 arch/mips/kernel/vmlinux.lds.S | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.=
S
index 5d6563970ab2..05eda9d9a7d5 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -227,4 +227,39 @@ SECTIONS
 =09=09*(.pdr)
 =09=09*(.reginfo)
 =09}
+
+=09/*
+=09 * Sections that should stay zero sized, which is safer to
+=09 * explicitly check instead of blindly discarding.
+=09 */
+
+=09.got : {
+=09=09*(.got)
+=09=09*(.igot.*)
+=09}
+=09ASSERT(SIZEOF(.got) =3D=3D 0, "Unexpected GOT entries detected!")
+
+=09.got.plt (INFO) : {
+=09=09*(.got.plt)
+=09}
+=09ASSERT(SIZEOF(.got.plt) =3D=3D 0, "Unexpected GOT/PLT entries detected!=
")
+
+=09.plt : {
+=09=09*(.plt)
+=09=09*(.plt.*)
+=09=09*(.iplt)
+=09}
+=09ASSERT(SIZEOF(.plt) =3D=3D 0, "Unexpected run-time procedure linkages d=
etected!")
+
+=09.rel.dyn : {
+=09=09*(.rel.*)
+=09=09*(.rel_*)
+=09}
+=09ASSERT(SIZEOF(.rel.dyn) =3D=3D 0, "Unexpected run-time relocations (.re=
l) detected!")
+
+=09.rela.dyn : {
+=09=09*(.rela.*)
+=09=09*(.rela_*)
+=09}
+=09ASSERT(SIZEOF(.rela.dyn) =3D=3D 0, "Unexpected run-time relocations (.r=
ela) detected!")
 }
--=20
2.30.0


