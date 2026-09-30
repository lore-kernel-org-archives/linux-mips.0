Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA06D3CFF66;
	Wed, 30 Sep 2026 19:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790794921; cv=none; b=oDljRiXPAGQX3g+Wo63yTt+ebpyx5p9S96N+Y1CEqf8tzDdwtGM6aGby++rpoMWkZcoL1uPMvhTsCtqZDmICOBkFFub9mynmezRaTs6BDB48fln4pzctWptVEeXgXBPfAVol9gXgm1hjTzyT4FT9Lyydtoef9LXfQd2Ba4Hw2ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790794921; c=relaxed/simple;
	bh=kBmb2i2aULVx6lLRYe4dVCAbXGOd5VjxoKxP2yDr840=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=VsODIzm5yKeMBlfaMvzFttXRW2P+vKo17gp1wA0t2dLVeqtI3QxMVo6IpkuULs44b23ONTlSUMOV4PEapH0UYgiMwifJQ6A/curecCAMoW2CYqwekf/EyuLePNxratEa8OEM0gL0JpM2g3jsr+DnF5oS8Er7BOn/oMHomBT1eiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fFiKF37h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fFiKF37h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 634411F000FF;
	Wed, 30 Sep 2026 19:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1790794920;
	bh=iAsReCTytLlPmWcEOHSoj1dgR274NQzuT79OvkmOz4o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fFiKF37hUkAaT3syIQ0DpdkG1CSyfgYKzcoxFjEp35VVkyQroO8/A1Oocn2EKN9vZ
	 JVVIoIiXnsZ0uINyVGVWT4KR0usM73P2RfcLFsaUwsLSmmx3g69d9hPm+sXi24Z+DE
	 NHsagci6EXTheHl7sWTUmsa2UYuIvv6NZVSAV4aA=
Date: Wed, 30 Sep 2026 12:01:59 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Josh Law <objecting@objecting.org>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Linux Memory Management List
 <linux-mm@kvack.org>, linux-mips@vger.kernel.org, Bradley Morgan
 <brads@mainlining.org>
Subject: Re: arch/mips/boot/compressed/decompress.c:undefined reference to
 `__ashldi3'
Message-Id: <20260930120159.7e4f29a82d461bd8b040454e@linux-foundation.org>
In-Reply-To: <202609301826.MFaFMsmd-lkp@intel.com>
References: <202609301826.MFaFMsmd-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 30 Sep 2026 18:36:50 +0200 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   551c722f40809618230001baccf219193e22fc5a
> commit: d4dba3b9c03a326cfa73833d6b166aeb442f82b5 lib: decompress_bunzip2: fix 32-bit shift undefined behavior
> date:   6 months ago
> config: mips-randconfig-r2300-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301826.MFaFMsmd-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 15.2.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301826.MFaFMsmd-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: d4dba3b9c03a ("lib: decompress_bunzip2: fix 32-bit shift undefined behavior")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609301826.MFaFMsmd-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    mips-linux-ld: arch/mips/boot/compressed/decompress.o: in function `get_bits':
> >> arch/mips/boot/compressed/decompress.c:(.text+0xf4): undefined reference to `__ashldi3'
> >> mips-linux-ld: arch/mips/boot/compressed/decompress.c:(.text+0x168): undefined reference to `__ashldi3'

I dunno, I'd be suspecting a toolchain issue here?

--- a/lib/decompress_bunzip2.c
+++ b/lib/decompress_bunzip2.c
@@ -135,7 +135,7 @@ static unsigned int INIT get_bits(struct bunzip_data *bd, char bits_wanted)
 		}
 		/* Avoid 32-bit overflow (dump bit buffer to top of output) */
 		if (bd->inbufBitCount >= 24) {
-			bits = bd->inbufBits&((1 << bd->inbufBitCount)-1);
+			bits = bd->inbufBits & ((1ULL << bd->inbufBitCount) - 1);
 			bits_wanted -= bd->inbufBitCount;
 			bits <<= bits_wanted;
 			bd->inbufBitCount = 0;
@@ -146,7 +146,7 @@ static unsigned int INIT get_bits(struct bunzip_data *bd, char bits_wanted)
 	}
 	/* Calculate result */
 	bd->inbufBitCount -= bits_wanted;
-	bits |= (bd->inbufBits >> bd->inbufBitCount)&((1 << bits_wanted)-1);
+	bits |= (bd->inbufBits >> bd->inbufBitCount) & ((1ULL << bits_wanted) - 1);
 
 	return bits;
 }

32-bit MIPS should be able to do this?
