Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id E4C6F116;
	Tue,  5 Dec 2023 03:00:32 -0800 (PST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1rATAC-0000XE-00; Tue, 05 Dec 2023 12:00:28 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 26F26C0A1E; Tue,  5 Dec 2023 12:00:15 +0100 (CET)
Date: Tue, 5 Dec 2023 12:00:15 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@rothwell.id.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/20] mips: address -Wmissing-prototypes warnings
Message-ID: <ZW8Cv8ck9JoyLuLi@alpha.franken.de>
References: <20231204115710.2247097-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204115710.2247097-1-arnd@kernel.org>

On Mon, Dec 04, 2023 at 12:56:50PM +0100, Arnd Bergmann wrote:
> The patches could either go through Thomas's mips tree, or
> alternatively through linux-mm along with the hexagon patches
> that Andrew has already merged.

I'd prefer to have in MIPS tree to also fix the other missing pieces.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
