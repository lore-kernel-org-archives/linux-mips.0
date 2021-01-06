Return-Path: <linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5312AC433E0
	for <linux-mips@archiver.kernel.org>; Wed,  6 Jan 2021 20:09:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BE5B23136
	for <linux-mips@archiver.kernel.org>; Wed,  6 Jan 2021 20:09:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbhAFUIy (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Wed, 6 Jan 2021 15:08:54 -0500
Received: from mail-02.mail-europe.com ([51.89.119.103]:57534 "EHLO
        mail-02.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbhAFUIy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 Jan 2021 15:08:54 -0500
Date:   Wed, 06 Jan 2021 20:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1609963650; bh=y++KTID87p0awo1xB/yYLOezpj3SKaTGHD5nqOFuw5Y=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=ajaFlDaxXHQ/kzg8Z62QRL4gWmvnscFm/2xr9pZ2VlUqSwawmqJRc1A4zTtZyBUI+
         baiWpEgrPMT6nyubyOwJUf5KJOEZKhVlVXEJTZVSMtV+sNfS0OsgBI52OK7qZbWVv1
         VwTyplMFf0L6/01GcGHYyn8fts52MEh9Ojj/AwRIJZlD41vnX9ZPFvdRC7C4X58nhJ
         rkjsvAYHnfBVO1qQmEShAPxqtCoiMT6TJJpXoj/Y1CARUKPiJAA4fvHO5xklIVovQd
         yvgjQPNOLETD/rTOIHa7ROWPtze+oHfd5agrQFcPa+8TJkhm4rT5iLfpOXOPMZ5nym
         MuZxO7ikOsE5Q==
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
Subject: [PATCH v2 mips-next 0/4] MIPS: vmlinux.lds.S sections fix & cleanup
Message-ID: <20210106200713.31840-1-alobakin@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This series hunts the problems discovered after manual enabling of
ARCH_WANT_LD_ORPHAN_WARN, notably the missing PAGE_ALIGNED_DATA()
section affecting VDSO placement (marked for stable).

Compile and runtime tested on MIPS32R2 CPS board with no issues.

Since v1 [0]:
 - catch .got entries too as LLD may produce it (Nathan);
 - check for unwanted sections to be zero-sized instead of
   discarding (Fangrui).

[0] https://lore.kernel.org/linux-mips/20210104121729.46981-1-alobakin@pm.m=
e

Alexander Lobakin (4):
  MIPS: vmlinux.lds.S: add missing PAGE_ALIGNED_DATA() section
  MIPS: vmlinux.lds.S: add ".gnu.attributes" to DISCARDS
  MIPS: vmlinux.lds.S: catch bad .got, .plt and .rel.dyn at link time
  MIPS: select ARCH_WANT_LD_ORPHAN_WARN

 arch/mips/Kconfig              |  1 +
 arch/mips/kernel/vmlinux.lds.S | 39 +++++++++++++++++++++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

--=20
2.30.0


