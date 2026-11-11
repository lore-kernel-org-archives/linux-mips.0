Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365175;
	b=2HDQLsPj+LAQ8IQSXQUVjLo5Tx9C06xUeFld09+aAoo9e1mCMnfRdmk522Nhk7NfTWgG
	 iAjnRyp/H3XD94H8Wuc2YUbp1wG7OUlE16lSrCUdfkX0GmL2wkB23INqirZuDa/B23/uW
	 SuALVgsag5q9yDfyTrouDASmUcxynrGSX0NBz3KG4TercTDb7/N27bpX9uj+EUJCG5rx/
	 YWm79DUAH3aJXKR6L7QXdESaZOmr9N6on9ngXDvTAqFPv4wKugmMRcp3ePU+1T4V6yRXi
	 zQLtiE2X6PdKhk8FUy3ZX6vgtI0oIww2cvzPlrWtCm9Sxh+Kr6hUSHddLLb51vGiuqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365175;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=aHtsWtah6vBal2nFE0nb7JH5Z6v+Kv/eLAAK7lJjA5E=;
	b=kL+ve6ztjUbSJuCukBncMjJ1VLdjpJQr81whq3rNLPmEO0wb0kZiKG/0JqyMasTCs5Z7
	 EvMFcYwFIqJby0frUZ5CYh0octM0v2XFfzBkMVdew93MSNUFhJ1DlOP2mf3y8MBKNdQuv
	 PKggqwLaKG9etK+aZHaekYRfWTNFEb7HnMAzDPtCCQK7U2+mrcygplY7U9UJh7gSzPjSh
	 Edx9z6x8mp7PgcJUZblnltKwJqNIsrEqJj/lOFpol4vqWBcEhI8RKCvU6GT1HUBsfPQpt
	 PI6rewWYeSYDcIIaaWfwB15oyhaNDSoIIpTSCakS7Mnz8QBSRsaaREq8CmjxRuZQflQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=oBZnDbfJ;
	arc=none smtp.remote-ip=79.135.106.119
Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B8C606A327
	for <linux-mips@vger.kernel.org>; Wed, 11 Nov 2026 02:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78B8C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=oBZnDbfJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794365170; x=1794624370;
	bh=aHtsWtah6vBal2nFE0nb7JH5Z6v+Kv/eLAAK7lJjA5E=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=oBZnDbfJE+5vsPCws+ii6madHrhRZi6XXLYyknlYoK99vCbQoZgs9yvya5GtEgzYH
	 kdLwa3cG8IfVRG4cXXEuVNoV9bM9DHmCP/qHAG/7ift0JmVO2TT7SEkqFb+AEdRj/M
	 +hNjjt2BwhE+JNMYaKINM7tR5cu4wfR5NufNF0ZOzHKD/LZjOo+acB0rSR5z0cijo2
	 NPYn1jGL+rG/oIKRR52wu4psruO5UTSG8qtnvciiGMdFo5tt9VgvRN66GhJanGNUno
	 QYGrcaW5UgOYyfAteqIWLAGXt91XLYHPIYX73b7Jpex0pZCYJNAdMfZEudpI19f8gW
	 ftU1c0EtYnWuA==
Date: Wed, 11 Nov 2026 02:46:05 +0000
To: linux-mips@vger.kernel.org
From: "Michael C. Pratt" <mcpratt@pm.me>
Cc: "Michael C. Pratt" <mcpratt@pm.me>, linux-kernel@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] mips: vdso: fix uninitialized warning for genvdso
Message-ID: <20261111024520.17905-1-mcpratt@pm.me>
Feedback-ID: 27397442:user:proton
X-Pm-Message-ID: 44b5b34ebae7b8e695f22c6f6b8ea6e86db309ed
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On older versions of GCC such as GCC 10.2.1,
it is possible that a "maybe-uninitialized" warning is triggered
for the pointer variables in the header's inline functions
when all warnings are enabled.

Resolve this warning by initializing all the pointers to NULL.

Signed-off-by: Michael C. Pratt <mcpratt@pm.me>
---
 arch/mips/vdso/genvdso.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/mips/vdso/genvdso.h b/arch/mips/vdso/genvdso.h
index 9bfb874038b0..112f51e2e546 100644
--- a/arch/mips/vdso/genvdso.h
+++ b/arch/mips/vdso/genvdso.h
@@ -7,9 +7,9 @@
 static inline bool FUNC(patch_vdso)(const char *path, void *vdso)
 {
 =09const ELF(Ehdr) *ehdr =3D vdso;
-=09void *shdrs;
-=09ELF(Shdr) *shdr;
-=09char *shstrtab, *name;
+=09void *shdrs =3D NULL;
+=09ELF(Shdr) *shdr =3D NULL;
+=09char *shstrtab =3D NULL, *name =3D NULL;
 =09uint16_t sh_count, sh_entsize, i;
=20
 =09shdrs =3D vdso + FUNC(swap_uint)(ehdr->e_shoff);
@@ -58,10 +58,10 @@ static inline bool FUNC(patch_vdso)(const char *path, v=
oid *vdso)
 static inline bool FUNC(get_symbols)(const char *path, void *vdso)
 {
 =09const ELF(Ehdr) *ehdr =3D vdso;
-=09void *shdrs, *symtab;
-=09ELF(Shdr) *shdr;
-=09const ELF(Sym) *sym;
-=09char *strtab, *name;
+=09void *shdrs =3D NULL, *symtab =3D NULL;
+=09ELF(Shdr) *shdr =3D NULL;
+=09const ELF(Sym) *sym =3D NULL;
+=09char *strtab =3D NULL, *name =3D NULL;
 =09uint16_t sh_count, sh_entsize, st_count, st_entsize, i, j;
 =09uint64_t offset;
 =09uint32_t flags;
--=20
2.30.2


