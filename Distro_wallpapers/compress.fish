 #!/usr/bin/fish
function compress_wallpapers
    for distro in *
    if test "$distro" = "raw"
        continue
    end
    
    if test "$distro" = "input"
        continue
    end
    
    if test "$distro" = "README.md"
        continue
    end
    if test "$distro" = "compress.fish"
        continue
    end
    if test "$distro" = "package"
	continue
    end
        tar -zcvf $distro.tar.gz $distro
 end
end
	if test -d package
	else
	mkdir package
	end

	if test -d input
        else
        mkdir input
        end

rm package/*
cd input
compress_wallpapers
cd ..
mv input/*.tar.gz package/
date +"%Y-%m-%d_%T" -u > package/date.txt
echo "Built!"
