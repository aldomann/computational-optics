function wbmcb(src,evnt)
global ah;
cp = get(ah,'CurrentPoint');
xdat = sprintf('%f',cp(1,1));
ydat = sprintf('%f',cp(1,2));
xlabel(xdat);
ylabel(ydat);
end