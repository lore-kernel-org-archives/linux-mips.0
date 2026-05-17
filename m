Received: from server.a16n.net (server.a16n.net [82.67.174.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B48E30C179
	for <linux-mips@vger.kernel.org>; Sun, 17 May 2026 20:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.67.174.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779048564; cv=none; b=oPoDbrEiVV1BFvW4KidB26lGVAVMerdwba6lmZRtDnon5TvTocIDFwg6ARYZoIS1L8M00/trBw0XTDUFmmpQWPo2SpNfxvLCyRfxhpqGzWO9XqV7S2kmksNzDMw+lY2RR45dQWCMYX3wbqaoJNg0B9b+c4bGpHqzEjEaDNoP/mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779048564; c=relaxed/simple;
	bh=l8CkytgO7MsSs0ThxVZCUYjM6c9AHfIdQ4Bj4FoutNI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k2ZFAEmatGhydfHA+AGYP1fygp9QcyvO6lZHel7x25n56tKewJWc7SmRqlkPjstYhiacYT/mBFqqhLR7w/rzxFeUGE47JtHnSe+oAXQUv31e2FV8dV6Y9fELx9JItmAsTGL65pRjZh4tWtSMgLXgcSPdWVjhee+R7sifoeFTZW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=a16n.net; spf=pass smtp.mailfrom=a16n.net; dkim=pass (2048-bit key) header.d=a16n.net header.i=@a16n.net header.b=NYN7MXhW; arc=none smtp.client-ip=82.67.174.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=a16n.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a16n.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=a16n.net header.i=@a16n.net header.b="NYN7MXhW"
Received: from ws.localdomain (21.197.30.93.rev.sfr.net [93.30.197.21])
	by server.a16n.net (Postfix) with ESMTPSA id 07A7E640654;
	Sun, 17 May 2026 22:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a16n.net; s=a16n;
	t=1779048558; bh=kvz5kPi0OkhVSdw2fiPcGB5LCqbvyetPuhMb4A95O3s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=NYN7MXhWvQz/Uefk/cfmvSrgaDQEVXkc0zCpsLAagGNrxgNtY20j/EcGZkGDb5zV+
	 KyQrCIyId0uiPJS98n10s+YLZ2HcmkXlgWu0OsIMN9pDbCjVvS7qOluV7OjDXalUet
	 UV3LDnXfNYPtFC0FaGHrI7MoTSjQLby09wr7/fbTPdtDhRuk1w3ArDUQuXfBp+nhVx
	 Ftz3W/xlonlb+KSYdLMDMJCEXC4C32AMrzIGRHRMpBic/+I5WhNkhiP6vOxFLNdK7W
	 w+nUcCNV8YLF4/vjC9VrEa2q/QSyzjq94cY1r1nJLjRsAgTTESgEzOkdrUMDdKnUAu
	 rGfaxiDf/G5Mw==
Received: by ws.localdomain (Postfix, from userid 1000)
	id EECAD306CBF; Sun, 17 May 2026 22:09:16 +0200 (CEST)
From: =?utf-8?Q?Peter_M=C3=BCnster?= <pm@a16n.net>
To: linux-mips@vger.kernel.org
Cc: Waldemar Brodkorb <wbx@openadk.org>
Subject: Re: Asus WL500g Premium (BCM47XX) problem
In-Reply-To: <agoFSZ8pdS_bt3C-@waldemar-brodkorb.de>
References: <aZ3NVrKLKgsflL1H@waldemar-brodkorb.de>
	<aZ-Ldi2U-51z3tF5@waldemar-brodkorb.de> <87y0hhgbip.fsf@a16n.net>
	<agoFSZ8pdS_bt3C-@waldemar-brodkorb.de>
Date: Sun, 17 May 2026 22:09:16 +0200
Message-ID: <87cxytg5n7.fsf@a16n.net>
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

On Sun, May 17 2026, Waldemar Brodkorb wrote:

> It is not integrated.

Is it planned? If not, what could I do please, to make it happen?


> You can find the patch which applies on latest 6.18 kernel here:

I get "Error: Forbidden"...

=2D-=20
           Peter

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iGoEARECACoWIQS/5hHRBUjla4uZVXU6jitvQ7HLaAUCagogbAwccG1AYTE2bi5u
ZXQACgkQOo4rb0Oxy2gVRACfXpoQn4EMWPG/xBfAeMqkeN8K1mQAoOu2eKByFajh
gdlkAX/WxsvDKdyK
=l1lf
-----END PGP SIGNATURE-----
--=-=-=--
