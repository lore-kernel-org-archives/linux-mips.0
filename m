Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074095;
	b=XQOkTJ5KUjKs8eb+wI0YrLm+TvTUQsXOkEmtKQt5Dh+ne9hHb7vw+wfCOicOKAwbRYdD
	 kj06U6IY7yS5ffsJnju+yK7nhFIvjVYcDGwJGDBAPvfTRTkccVfctX80kWFgPLkqZvQL2
	 +mN6H26qD4oifrBxsq2ej645A1MU8HuZNQzac+Zii0NT3EG4EuHyN7kOgiVFzGyjk7oTx
	 3jQYVr8q/6UAKcMMqb1j9wWyAmYrBg1Vp1ObbYP3zUzlP9a2ztTGf7+rSqMs9KbZcOZP6
	 RfvlElqE+OV3rBFd14numZNvf/s3j+DWt6W0d8FeLPpVf2FF0/0EzazufV2/Oy8bzYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074095;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hNd5MCBb+RwQDRLrwFjdA5miwBKz7JlHYmdVmb0QLqo=;
	b=0vJUSqdZAyEGUvyQnD8OAkLaZjYO38mg6pbiWcaHVHn4nkB9h245u+PcPqYkDDVchH32
	 xF+mxlNk78X6p5PQ5cN5GeoT2nZ2itAlIgE72JzdfqeRx9nM/72XvbspySE2v8+RxRSCA
	 jXUo7RbBhhv6MlzzlOJvVC7GL+z9b5N6UTjuI763P/CEYjDm9hgbfBimmRHYBZSB5Gs6Q
	 T2MqP7IrsdDZ7ZT36egnLcW1rCYQqeudS+8E9Zm2kIWpD2vvRBza+H8wrOYCSXHbTu9tj
	 8+vPbkGHtYFx9Nv6+5pBwPiK0QhbPK6s9n3vdniGM4Jf7xhRVv5yNIX+nKsJLJgeUPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jRpAWJeD;
	arc=none smtp.remote-ip=95.215.58.104
Received: from mta1.migadu.com (out-104.mta1.migadu.com [95.215.58.104])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89631606A32F
	for <linux-mips@vger.kernel.org>; Thu, 19 Nov 2026 07:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89631606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jRpAWJeD
X-Envelope-To: linux-mips@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6tO+X4PnRnD+Jk0uYi9e+cJ5+jxuZiQPrphEOsBPyUs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795074090; v=1; x=1795678890;
 b=jRpAWJeDfhzRjp0tMgYsPxG27OVP/tOWcJ/LQhjQ73YyguUVzBJIk9e6igo5ThSrN/dX9FMW
 bZra7IUn8I/rAqXJ0NlITYqlsau1cJMj9jUX1QQPXNjf97NVYMKnp1K1+v+f+gbq9xnGbaFV9/k
 QXdNQC1HwUPojy675ONU9hn0=
X-Envelope-To: linux-mips@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id f0d3d04c8dc3375f;
	Thu, 19 Nov 2026 07:41:30 +0000
X-Mizu-Trace-ID: f0d3d04c8dc3375f
X-Migadu-Flow: FLOW_OUT
Date: Thu, 19 Nov 2026 15:41:24 +0800
From: Baoquan He <baoquan.he@linux.dev>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Paul Walmsley <pjw@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>, Rich Felker <dalias@libc.org>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Cong Wang <cwang@multikernel.io>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	WANG Xuerui <kernel@xen0n.name>, kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 1/2] MAINTAINERS: add kernel/Kconfig.kexec to KEXEC
Message-ID: <av6oJBDv2fAaWSog@fedora>
References: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org>
 <20261119-arch-kconfig-v1-1-37c276fe4d26@kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Post: <mailto:linux-mips@vger.kernel.org>
List-Help: <mailto:linux-mips+help@vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-mips+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-arch-kconfig-v1-1-37c276fe4d26@kernel.org>

On 11/19/26 at 08:16am, Mike Rapoport (Microsoft) wrote:
> kernel/Kconfig.kexec is not matched by the KEXEC entry, so
> get_maintainer.pl does not report kexec maintainers for changes in that
> file.
> 
> Add it to the KEXEC entry.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Baoquan He <baoquan.he@linux.dev>

> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d738990161bd0..c61a1f0ad330e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14782,6 +14782,7 @@ W:	http://kernel.org/pub/linux/utils/kernel/kexec/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git
>  F:	include/linux/kexec.h
>  F:	include/uapi/linux/kexec.h
> +F:	kernel/Kconfig.kexec
>  F:	kernel/kexec*
>  
>  KEXEC HANDOVER (KHO)
> 
> -- 
> 2.53.0
> 
