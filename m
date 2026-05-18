Received: from server.a16n.net (server.a16n.net [82.67.174.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22C43DCD8D
	for <linux-mips@vger.kernel.org>; Mon, 18 May 2026 06:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.67.174.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779086645; cv=none; b=YZ4FJeLSiSy+Sjxk3JG3Rw9hKly069RCNmciOcMbHYl1bbkjEFcpYSGMRAAz0r+u6WQzMqrVnO1Rf/Ro6hF7pMBOAQhPElyO7WI1aqtGWKlqNKRTtkFQMBAxDpi1W+leoLLBC7IbhWlvaWaggsj6l3WYOjOEnJ2fimjhLXsQLCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779086645; c=relaxed/simple;
	bh=0fhhiRjxw6BO4mIJMn0IwGlTSU3mV0D0QcyUyCZAJ84=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AGkO/Ll3jnO6mD7wjg8Iwl0KuIZsMkNCGCBbVP2pjTKgKqYjtcrXOttKC7Xg1VWMtERixaq5Vb0CiR5wFDcQvG0i9AxDG4bmRByxPmH4OsG4uvjanu50PnqjfdXh7xxAOo0EGzeQ3YUEmy40XgV3U/moazzCZpvgS4rt5GUXCdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=a16n.net; spf=pass smtp.mailfrom=a16n.net; dkim=pass (2048-bit key) header.d=a16n.net header.i=@a16n.net header.b=ktXWhlxy; arc=none smtp.client-ip=82.67.174.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=a16n.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a16n.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=a16n.net header.i=@a16n.net header.b="ktXWhlxy"
Received: from ws.localdomain (21.197.30.93.rev.sfr.net [93.30.197.21])
	by server.a16n.net (Postfix) with ESMTPSA id 84DE364065A;
	Mon, 18 May 2026 08:43:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a16n.net; s=a16n;
	t=1779086626; bh=n+jfizWghm70l2OQoO1HV2gfAdPqrNniaYgETb7MIXE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ktXWhlxyfcvl5ICyyAk4pUpZHAwry0q1YXQoK50QVRmDhcL7wYcwkXxf/rxDHRni6
	 gIobkQjrpICtCiy8rPYLDT+oh3Op/BFwNa00adtmMHhZmlSiAZ6639eEDKC8xva/tC
	 vR5vgjJ//PpIr/GVL8QRHdI7Hbg+lpjyeQEU6VirBDZWbIHtBDklFzwlKhaMszbaCM
	 Q9CL/8ZB/dSHiTwNkdZ2r2BrsL5ZJhnGac/DvAHO0C1xbJ3DNt/+udpBoXe5AFOdkB
	 H52M4MHdaKbNzt91uAjplaT0N6N3RpOW9sjeIyHIBImv5b+CqDgnXb12tZD3C4xpkZ
	 ZP+YVPBkkPAzg==
Received: by ws.localdomain (Postfix, from userid 1000)
	id 8995D306CBF; Mon, 18 May 2026 08:43:45 +0200 (CEST)
From: =?utf-8?Q?Peter_M=C3=BCnster?= <pm@a16n.net>
To: linux-mips@vger.kernel.org
Cc: Waldemar Brodkorb <wbx@openadk.org>
Subject: Re: Asus WL500g Premium (BCM47XX) problem
In-Reply-To: <agqWtz_66N5KkBv7@waldemar-brodkorb.de>
References: <aZ3NVrKLKgsflL1H@waldemar-brodkorb.de>
	<aZ-Ldi2U-51z3tF5@waldemar-brodkorb.de> <87y0hhgbip.fsf@a16n.net>
	<agoFSZ8pdS_bt3C-@waldemar-brodkorb.de> <87cxytg5n7.fsf@a16n.net>
	<agqWtz_66N5KkBv7@waldemar-brodkorb.de>
Date: Mon, 18 May 2026 08:43:45 +0200
Message-ID: <87wlx1cj4u.fsf@a16n.net>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Mon, May 18 2026, Waldemar Brodkorb wrote:

> What device do you have?

Hi Waldemar,

The WL500g-P.


> Can you test the patch,

Yes, perhaps in 1-2 weeks.


> maybe I can resend it.

That would be nice. Here is the guide:
https://docs.kernel.org/process/submitting-patches.html
You should include "[PATCH]" in the subject.


> Last time I got no response,

I guess because of the missing "[PATCH]".


> You can always clone my repo of FreeWRT to get the patch:

Thanks!

Kind regards,
=2D-=20
           Peter

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iGoEARECACoWIQS/5hHRBUjla4uZVXU6jitvQ7HLaAUCagq1IQwccG1AYTE2bi5u
ZXQACgkQOo4rb0Oxy2hXSQCgg8rUEO1Mdus+HRWPnCOm9WtUUXsAnjkBHxwZP4kp
Wqaca71G+xjJ/h62
=W0xU
-----END PGP SIGNATURE-----
--=-=-=--
