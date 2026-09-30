Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDAE3B3BF2;
	Wed, 30 Sep 2026 19:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790795497; cv=none; b=a4v1l63x+aigwDrzhGUUBD9FHC0iDVlEuTijKdUX+lvlYvUpYiiKC7QpKo1+jJCwk/lwr6rRylLa+BWTlqMDFTMRCfJupmlGM05+GWhwzIsDAbIm6ryeXCdT4FRAVnRKHSRPCLKCdmP4HW25A4839JDE/w3Wt5OjO1cmrcju7I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790795497; c=relaxed/simple;
	bh=gb8eQ5i4BC3qVK7yqNs13352HPC6Q22p6a71yUgU0LM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=nsq5rK+R4V8heyJDTPtl4czaFNTv7oZLUAwFKy+BY0dlRlbLWyHluqk+UH37UiqIJsZpaZgEa+7/iQlbQLHmevYimuO6E2m+b3KqTWjPEY999IuT7wzquAnRClXTihkEqIDNFd++7YR5mQ9WCln1QcM9iL2cqEu3AII4QksgtVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=ObDhVDvx; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=10WkqNZu; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="ObDhVDvx";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="10WkqNZu"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790795479; bh=VpZV97Cwjs5goSri4w8L3iV
	cVdvLrP3PUPbT0IsRN1A=; b=ObDhVDvx7MRGSnb33FXqa4ATiT9Spj1zkKsc5qH7v54nJCY1wP
	54vZZOySYgoDiEITHKK/Lgtm53SWAPEicKhLQ3+IOzBklqoTnjI0HmiKVCSI++/D3+tGN0jGKuS
	SV0xafniay5gaDxFQh0snFTEOJCUDx67Zm37m+G9sr3uBxEFIV/AkcAIGhEZvScW59CnTHPjpNx
	9ZilIb/IOP5uZp4g0o562pB2Wlcij8gxc0OYGzuaZo0LtlrvSd0HQNK8wv2R4H+JT7o46geEHdE
	Hj+BJzW2oc15wPkPUB+sO64MvQRYeiRJR2HJvoRJ4wceoG5MoKVYB0+2jeSlyJNmM3g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790795479; bh=VpZV97Cwjs5goSri4w8L3iV
	cVdvLrP3PUPbT0IsRN1A=; b=10WkqNZuKbJLsSANU3U5j9TXOBMIXBDVdf/sr/x0AWhW1qFwg1
	4dsET1VrCiUW/7eL9EwDp+BTJClKJVbSnPAQ==;
Date: Wed, 30 Sep 2026 20:11:18 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>
CC: Josh Law <objecting@objecting.org>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-mips@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_arch/mips/boot/compressed/decompre?=
 =?US-ASCII?Q?ss=2Ec=3Aundefined_reference_to_=60=5F=5Fashldi3=27?=
In-Reply-To: <20260930120159.7e4f29a82d461bd8b040454e@linux-foundation.org>
References: <202609301826.MFaFMsmd-lkp@intel.com> <20260930120159.7e4f29a82d461bd8b040454e@linux-foundation.org>
Message-ID: <B2E9C8DD-202A-4C86-B349-C0FCCE3AF17B@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 30 September 2026 20:01:59 BST, Andrew Morton
<akpm@linux-foundation.org> wrote:
>On Wed, 30 Sep 2026 18:36:50 +0200 kernel test robot <lkp@intel.com>
>wrote:
>
>> tree:  
>https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> head:   551c722f40809618230001baccf219193e22fc5a
>> commit: d4dba3b9c03a326cfa73833d6b166aeb442f82b5 lib:
>decompress_bunzip2: fix 32-bit shift undefined behavior
>> date:   6 months ago
>> config: mips-randconfig-r2300-20260930
>(https://download.01.org/0day-ci/archive/20260930/202609301826.MFaFMsmd-lkp@intel.com/config)
>> compiler: mips-linux-gcc (GCC) 15.2.0
>> sparse: v0.6.5-rc1
>> reproduce (this is a W=1 build):
>(https://download.01.org/0day-ci/archive/20260930/202609301826.MFaFMsmd-lkp@intel.com/reproduce)
>> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new
>version of
>> the same patch/commit), kindly add following tags
>> | Fixes: d4dba3b9c03a ("lib: decompress_bunzip2: fix 32-bit shift
>undefined behavior")
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes:
>https://lore.kernel.org/oe-kbuild-all/202609301826.MFaFMsmd-lkp@intel.com/
>> 
>> All errors (new ones prefixed by >>):
>> 
>>    mips-linux-ld: arch/mips/boot/compressed/decompress.o: in function
>`get_bits':
>> >> arch/mips/boot/compressed/decompress.c:(.text+0xf4): undefined
>reference to `__ashldi3'
>> >> mips-linux-ld: arch/mips/boot/compressed/decompress.c:(.text+0x168):
>undefined reference to `__ashldi3'
>
>I dunno, I'd be suspecting a toolchain issue here?
>
>--- a/lib/decompress_bunzip2.c
>+++ b/lib/decompress_bunzip2.c
>@@ -135,7 +135,7 @@ static unsigned int INIT get_bits(struct bunzip_data *bd, char bits_wanted)
> 		}
> 		/* Avoid 32-bit overflow (dump bit buffer to top of output) */
> 		if (bd->inbufBitCount >= 24) {
>-			bits = bd->inbufBits&((1 << bd->inbufBitCount)-1);
>+			bits = bd->inbufBits & ((1ULL << bd->inbufBitCount) - 1);
> 			bits_wanted -= bd->inbufBitCount;
> 			bits <<= bits_wanted;
> 			bd->inbufBitCount = 0;
>@@ -146,7 +146,7 @@ static unsigned int INIT get_bits(struct bunzip_data *bd, char bits_wanted)
> 	}
> 	/* Calculate result */
> 	bd->inbufBitCount -= bits_wanted;
>-	bits |= (bd->inbufBits >> bd->inbufBitCount)&((1 << bits_wanted)-1);
>+	bits |= (bd->inbufBits >> bd->inbufBitCount) & ((1ULL << bits_wanted) - 1);
> 
> 	return bits;
> }
>
>32-bit MIPS should be able to do this?
May I ask why I got CCed in this..??
--- Thanks!
"I'm not a very positive person" - Linus torvalds
